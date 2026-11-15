# Exotic Tigers Controller

**Custom gamepad overlays for ExTYeredey and the Exotic Tigers community.**

The first theme, **Shadow Tiger**, is being prepared for an **Xbox Elite Series 2**, **GamePadViewer 2 (GPV2)** and **OBS Studio**.

> **Development status — assets recovery pending.** The controller was saved as `Exotic Controller` in GPV2, but its image URLs point to a temporary local server (`http://127.0.0.1:18764/reference-v2/`). This repository is being prepared as a permanent public host. It does **not** contain a verified, working skin yet.

## Visual direction

- Matte graphite/black chassis with restrained purple neon edges.
- Tiger eye on the left grip; subtle dark stripes and three orange claw marks on the right.
- `ExTYeredey` branding and readable Xbox controls.
- Separate rest/pressed images for buttons and triggers; independently animated thumbsticks.
- Transparent background for horizontal and vertical OBS scenes.

## How it works

GPV2 supports controller parts with separate image URLs for connected/disconnected, neutral and pressed states. The image assets must be publicly accessible from the GPV2 viewer. A localhost URL only works while the corresponding local server is running and may not be accessible from the viewer.

**Intended permanent URL pattern after GitHub Pages is enabled and the assets are recovered:**

```text
https://yeredeysuarez.github.io/exotic-tigers-controller/reference-v2/base.svg
```

This URL is **not valid until** the file is actually deployed and responds successfully.

## Repository

- `docs/`: GitHub Pages website and published assets (once recovered).
- `config/gpv2-reference.json`: verified GPV2 canvas and control geometry from screenshots.
- `scripts/recover-assets.ps1`: read-only discovery / optional non-overwriting download of local SVGs.
- `source/`: intended editable source art (not yet uploaded).

## Recovery and publication checklist

1. Recover `reference-v2/*.svg` from the Windows project or from the local web server while it is running. Verify each recovered SVG and inspect its content before committing.
2. Add the **actual working image assets** under `docs/reference-v2/`. Do not replace them with dummy files.
3. In GitHub: **Settings → Pages → Deploy from a branch → main → /docs**.
4. Verify every deployed SVG opens anonymously using HTTPS, including `base.svg`, buttons, bumpers, thumbsticks, D-pad and triggers.
5. In GPV2, make a backup of the current controller or settings, then replace each `127.0.0.1` URL with its matching GitHub Pages URL. Preserve width, height, positions and input mappings.
6. Save `Exotic Controller`. Test the overlay in the browser, in OBS and while a game is focused.

## Safety and usage

Do not commit passwords, access tokens, private user data or unrelated OBS configuration. Everything in GitHub Pages is public, even though the assets are intended for ExTYeredey's stream.

The project is public for transparency and documentation. **No reuse license has yet been granted** for the original ExTYeredey/Exotic Tigers artwork and branding.

---
**Brand:** ExTYeredey · Exotic Tigers  
**Platform:** Xbox Elite Series 2 · GamePadViewer 2 · OBS
