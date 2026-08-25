/* Shared helpers + theme sync for the neumorphism widget set. */
import * as zebar from "https://esm.sh/zebar@3.3.1";
import { PALETTES } from "./palettes.js";

export { zebar, PALETTES };

export const THEME_KEY = "xscriptor-theme";
export const CALENDAR_KEY = "xscriptor-calendar";
export const POPUP_CLOSE_KEY = (name) => `xscriptor-popup-${name}`;

export const el = (id) => document.getElementById(id);

export const setText = (id, text) => {
  const node = el(id);
  if (node) node.textContent = text;
};

export const setVisible = (id, visible) => {
  const node = el(id);
  if (node) node.classList.toggle("hidden", !visible);
};

export const meter = (meterId, percent) => {
  const node = el(meterId)?.querySelector(".meter-fill");
  if (node) node.style.width = `${Math.max(0, Math.min(percent, 100))}%`;
};

export function formatSpeed(bytes) {
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

export function formatSize(bytes) {
  if (bytes == null) return "\u2014";
  const units = ["B", "KB", "MB", "GB", "TB"];
  let value = bytes;
  let unit = 0;
  while (value >= 1024 && unit < units.length - 1) {
    value /= 1024;
    unit += 1;
  }
  return `${value.toFixed(value >= 100 ? 0 : 1)} ${units[unit]}`;
}

export function truncate(text, max) {
  return text.length > max ? `${text.slice(0, max - 1)}\u2026` : text;
}

export function applyTheme(id) {
  const theme = PALETTES.find((t) => t.id === id) ?? PALETTES[0];
  const root = document.documentElement;
  for (const [key, value] of Object.entries(theme.vars)) {
    root.style.setProperty(key, value);
  }
  localStorage.setItem(THEME_KEY, theme.id);
  return theme;
}

export function currentTheme() {
  const id = localStorage.getItem(THEME_KEY) ?? "x";
  return PALETTES.find((t) => t.id === id) ?? PALETTES[0];
}

// Apply the stored theme and react to changes made by other widgets.
applyTheme(currentTheme().id);
window.addEventListener("storage", (event) => {
  if (event.key === THEME_KEY) {
    applyTheme(event.newValue ?? "x");
  }
});
