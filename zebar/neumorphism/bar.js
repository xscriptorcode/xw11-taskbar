import * as zebar from "https://esm.sh/zebar@3.3.1";
import { PALETTES } from "./palettes.js";

const providers = zebar.createProviderGroup({
  cpu: { type: "cpu" },
  memory: { type: "memory" },
  battery: { type: "battery", refreshInterval: 5000 },
  audio: { type: "audio", refreshInterval: 2000 },
  disk: { type: "disk", refreshInterval: 10000 },
  network: { type: "network", refreshInterval: 2000 },
  media: { type: "media", refreshInterval: 2000 },
  host: { type: "host" },
  ip: { type: "ip", refreshInterval: 600000 },
  keyboard: { type: "keyboard", refreshInterval: 3000 },
});

const el = (id) => document.getElementById(id);
const setText = (id, text) => {
  const node = el(id);
  if (node) node.textContent = text;
};
const setVisible = (id, visible) => {
  const node = el(id);
  if (node) node.classList.toggle("hidden", !visible);
};
const meter = (meterId, percent) => {
  const node = el(meterId)?.querySelector(".meter-fill");
  if (node) node.style.width = `${Math.max(0, Math.min(percent, 100))}%`;
};

/* ---------- Theme switcher ---------- */

const themeName = el("theme-name");
let currentTheme = localStorage.getItem("xscriptor-theme") ?? "x";

function applyTheme(id) {
  const theme = PALETTES.find((t) => t.id === id) ?? PALETTES[0];
  const root = document.documentElement;
  for (const [key, value] of Object.entries(theme.vars)) {
    root.style.setProperty(key, value);
  }
  currentTheme = theme.id;
  themeName.textContent = theme.name;
  localStorage.setItem("xscriptor-theme", theme.id);
}

el("island-theme").addEventListener("click", () => {
  const index = PALETTES.findIndex((t) => t.id === currentTheme);
  applyTheme(PALETTES[(index + 1) % PALETTES.length].id);
});

applyTheme(currentTheme);

/* ---------- Clock: hour and day ---------- */

function renderClock() {
  const now = new Date();
  const hh = String(now.getHours()).padStart(2, "0");
  const mm = String(now.getMinutes()).padStart(2, "0");
  const dd = String(now.getDate()).padStart(2, "0");
  setText("clock", `${hh}:${mm} \u00b7 ${dd}`);
}
renderClock();
setInterval(renderClock, 1000);

/* ---------- Formatters ---------- */

function formatSpeed(bytes) {
  if (bytes == null) return "\u2014";
  const units = ["B/s", "KB/s", "MB/s", "GB/s"];
  let value = bytes;
  let unit = 0;
  while (value >= 1024 && unit < units.length - 1) {
    value /= 1024;
    unit += 1;
  }
  return `${value.toFixed(value >= 100 ? 0 : 1)} ${units[unit]}`;
}

function truncate(text, max) {
  return text.length > max ? `${text.slice(0, max - 1)}\u2026` : text;
}

/* ---------- Indicators ---------- */

function renderSystem(output) {
  const host = output.host?.hostname;
  const ip = output.ip?.address;
  const layout = output.keyboard?.layout;
  const parts = [host, ip, layout].filter(Boolean);
  setText("system", parts.join(" \u00b7 "));
  setVisible("island-system", parts.length > 0);
}

function renderMedia(output) {
  const session = output.media?.currentSession;
  if (!session?.title) {
    setVisible("island-media", false);
    return;
  }
  const artist = session.artist ? `${session.artist} \u2013 ` : "";
  setText("media", truncate(`${artist}${session.title}`, 40));
  setVisible("island-media", true);
}

function renderDisk(output) {
  const disks = output.disk?.disks ?? [];
  const main = disks
    .filter((d) => !d.isRemovable)
    .sort((a, b) => b.totalSpace.bytes - a.totalSpace.bytes)[0];
  if (!main || main.totalSpace.bytes === 0) {
    setVisible("island-disk", false);
    return;
  }
  const used =
    ((main.totalSpace.bytes - main.availableSpace.bytes) / main.totalSpace.bytes) * 100;
  setText("disk", `${Math.round(used)}%`);
  meter("meter-disk", used);
  setVisible("island-disk", true);
}

function renderTraffic(output) {
  const traffic = output.network?.traffic;
  if (!traffic) {
    setVisible("island-traffic", false);
    return;
  }
  setText("traffic-dl", formatSpeed(traffic.received?.bytes));
  setText("traffic-ul", formatSpeed(traffic.transmitted?.bytes));
  setVisible("island-traffic", true);
}

const VOLUME_GLYPHS = ["\uf026", "\uf026", "\uf027", "\uf027", "\uf028"];

function renderVolume(output) {
  const device = output.audio?.defaultPlaybackDevice;
  if (!device) {
    setVisible("island-volume", false);
    return;
  }
  const volume = device.volume ?? 0;
  const muted = device.isMuted || volume === 0;
  const glyphIndex = muted ? 0 : Math.min(4, Math.ceil(volume / 25));
  setText("volume-icon", VOLUME_GLYPHS[glyphIndex]);
  setText("volume", muted ? "MUTE" : `${Math.round(volume)}%`);
  setVisible("island-volume", true);
}

const BATTERY_GLYPHS = ["\uf244", "\uf243", "\uf242", "\uf241", "\uf240"];

function renderBattery(output) {
  const battery = output.battery;
  if (battery?.chargePercent == null) {
    setVisible("island-battery", false);
    return;
  }
  const percent = battery.chargePercent;
  const charging = battery.state === "charging" || battery.state === "full";
  setText("battery-icon", charging ? "\uf0e7" : BATTERY_GLYPHS[Math.min(4, Math.floor(percent / 25))]);
  setText("battery", `${Math.round(percent)}%`);
  setVisible("island-battery", true);
}

function renderStats(output) {
  const cpu = output.cpu?.usage;
  const mem = output.memory?.usage;
  setText("cpu", cpu !== undefined ? `${Math.round(cpu)}%` : "\u2014");
  setText("memory", mem !== undefined ? `${Math.round(mem)}%` : "\u2014");
  meter("meter-cpu", cpu ?? 0);
  meter("meter-memory", mem ?? 0);
}

/* ---------- Wiring ---------- */

function renderAll(output) {
  renderStats(output);
  renderSystem(output);
  renderMedia(output);
  renderDisk(output);
  renderTraffic(output);
  renderVolume(output);
  renderBattery(output);
}

renderAll(providers.outputMap);
providers.onOutput(() => renderAll(providers.outputMap));

/* ---------- Interactions ---------- */

el("island-volume").addEventListener("click", () => {
  const device = providers.outputMap.audio?.defaultPlaybackDevice;
  if (!device) return;
  const muted = device.isMuted || (device.volume ?? 0) === 0;
  providers.outputMap.audio?.setVolume(muted ? 60 : 0);
});

/* Popups: click an island to open its detail popup, click again (or Esc) to close. */
const POPUP_KEY = (name) => `xscriptor-popup-${name}`;

function togglePopup(name, width, height) {
  const key = POPUP_KEY(name);
  if (localStorage.getItem(key) === "open") {
    localStorage.setItem(key, "closed");
    return;
  }
  localStorage.setItem(key, "open");
  zebar.startWidget(name, {
    anchor: "top_center",
    offsetX: "0px",
    offsetY: "48px",
    width: `${width}px`,
    height: `${height}px`,
    monitorSelection: { type: "primary" },
    dockToEdge: { enabled: false, edge: null, windowMargin: "0px" },
  }).catch(() => {
    localStorage.setItem(key, "closed");
  });
}

el("island-system").addEventListener("click", () => togglePopup("system-popup", 280, 130));
el("island-media").addEventListener("click", () => togglePopup("media-popup", 280, 150));
el("island-disk").addEventListener("click", () => togglePopup("disk-popup", 300, 180));
el("island-cpu").addEventListener("click", () => togglePopup("cpu-popup", 280, 140));
el("island-memory").addEventListener("click", () => togglePopup("memory-popup", 280, 130));
el("island-traffic").addEventListener("click", () => togglePopup("traffic-popup", 280, 160));
el("island-battery").addEventListener("click", () => togglePopup("battery-popup", 280, 140));

/* Calendar popup: click the clock island to open/close it. */
const CALENDAR_KEY = "xscriptor-calendar";
const CAL_PLACEMENT = {
  anchor: "top_center",
  offsetX: "0px",
  offsetY: "48px",
  width: "280px",
  height: "240px",
  monitorSelection: { type: "primary" },
  dockToEdge: { enabled: false, edge: null, windowMargin: "0px" },
};

let calendarOpen = localStorage.getItem(CALENDAR_KEY) === "open";

el("island-clock").addEventListener("click", async () => {
  if (calendarOpen) {
    localStorage.setItem(CALENDAR_KEY, "closed");
    calendarOpen = false;
    return;
  }
  localStorage.setItem(CALENDAR_KEY, "open");
  calendarOpen = true;
  await zebar.startWidget("calendar", CAL_PLACEMENT);
});

window.addEventListener("storage", (event) => {
  if (event.key === CALENDAR_KEY) {
    calendarOpen = event.newValue === "open";
  }
});
