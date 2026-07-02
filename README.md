# CV — Shamsiddin Nabiev

Senior Software Engineer · Java / Real-Time Data · Dublin, Ireland

- **[resume.pdf](resume.pdf)** — one-page, ATS-friendly resume (print/apply-ready)
- **[resume.html](resume.html)** — source; edit and re-export to PDF

## Regenerate the PDF

Open `resume.html` in a browser and print to PDF (⌘P → Save as PDF), or headless:

```bash
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
  --headless=new --disable-gpu --no-pdf-header-footer \
  --print-to-pdf="resume.pdf" --virtual-time-budget=4000 \
  "file://$PWD/resume.html"
```

Design: single-column, no tables/columns/graphics, real selectable text — parses cleanly through applicant tracking systems.
