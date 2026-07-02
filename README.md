# CV — Shamsiddin Nabiev

[![View CV](https://img.shields.io/badge/View-CV-0b3d63?style=flat-square)](https://nshamsiddin.github.io/cv/)
[![Build](https://github.com/nshamsiddin/cv/actions/workflows/build.yml/badge.svg)](https://github.com/nshamsiddin/cv/actions/workflows/build.yml)
[![Pages](https://github.com/nshamsiddin/cv/actions/workflows/pages.yml/badge.svg)](https://nshamsiddin.github.io/cv/)

Senior Software Engineer · Java / Real-Time Data · Dublin, Ireland

**Live:** <https://nshamsiddin.github.io/cv/> — always the latest build.
Layouts: [Classic](https://nshamsiddin.github.io/cv/resume.pdf) ·
[Modern](https://nshamsiddin.github.io/cv/resume-modern.pdf) ·
[Minimal](https://nshamsiddin.github.io/cv/resume-minimal.pdf) ·
[Compact](https://nshamsiddin.github.io/cv/resume-compact.pdf)

**Content and presentation are separated:**

| File | Role | Edit it when… |
|------|------|---------------|
| [`resume.tex`](resume.tex) | **Content (data)** — pure `\job{}{}{}`, `\skill{}{}`, `\edu{}{}{}` calls, no styling | you change what the resume *says* |
| [`cv.cls`](cv.cls) | **Template** — all layout, colors, fonts, spacing, and the semantic commands | you change how it *looks* |
| [`resume.json`](resume.json) | **Machine-readable** ([JSON Resume](https://jsonresume.org) schema) — feeds schema.org JSON-LD on the site so AI/ATS/recruiter tools parse you cleanly | keep in sync with `resume.tex` |

The PDF is built automatically by GitHub Actions — you never edit or commit it by hand.

### Change the template and font

Both are **class options** on the first line of `resume.tex` — combine freely:

```latex
\documentclass[modern,sourcesans]{cv}   % template, font
```

**Templates** (all single-column and ATS-safe; each lives in `styles/<name>.tex`):

| Option | Look |
|--------|------|
| `classic` | serif, small-caps section rules (default) |
| `modern` | uppercase headers, full-width rules, airy tech look |
| `minimal` | monochrome, understated, maximum ATS-safety |
| `compact` | dense — smaller margins/spacing for content-heavy CVs |

**Fonts:**

```latex
\documentclass[charter]{cv}   % <- swap the option
```

Available options (all ship with TeX Live, so the CI build just works):

| Option | Style | Notes |
|--------|-------|-------|
| `lmodern` | serif | default |
| `charter` | serif | clean, very ATS-friendly |
| `palatino` | serif | Palatino-style |
| `times` | serif | Times-style |
| `helvet` | sans | Helvetica-style |
| `sourcesans` | sans | closest to a modern web look |
| `lato` | sans | Lato |

To use a font that isn't in TeX Live (e.g. Inter), the build must switch to XeLaTeX +
`fontspec` with the font vendored into the repo — ask if you want that.

## Workflow

1. Edit `resume.tex`.
2. `git push` — CI compiles it and uploads `resume.pdf` as a **build artifact**
   (visible under the run's *Artifacts*). This also catches any LaTeX errors.
3. When you want a shareable copy, cut a version tag:

   ```bash
   git tag v1.0 && git push origin v1.0
   ```

   CI then attaches the freshly built `resume.pdf` to a **GitHub Release** for that tag.
   Grab it from the repo's *Releases* page — always in sync with the source.

You can also trigger a build manually from the **Actions → Build resume PDF → Run workflow** button.

## Build locally (optional)

Any LaTeX engine works. With [tectonic](https://tectonic-typesetting.github.io/):

```bash
tectonic resume.tex     # -> resume.pdf
```

Design: single-column, no tables-as-layout / columns / graphics, real selectable text —
parses cleanly through applicant tracking systems (ATS).
