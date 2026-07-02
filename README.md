# CV — Shamsiddin Nabiev

Senior Software Engineer · Java / Real-Time Data · Dublin, Ireland

**Content and presentation are separated:**

| File | Role | Edit it when… |
|------|------|---------------|
| [`resume.tex`](resume.tex) | **Content (data)** — pure `\job{}{}{}`, `\skill{}{}`, `\edu{}{}{}` calls, no styling | you change what the resume *says* |
| [`cv.cls`](cv.cls) | **Template** — all layout, colors, fonts, spacing, and the semantic commands | you change how it *looks* |

The PDF is built automatically by GitHub Actions — you never edit or commit it by hand.

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
