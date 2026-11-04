// Extra styling for the handout PDFs (used by build_handouts.sh via pandoc).
#show raw.where(block: true): it => block(
  fill: luma(244), inset: 8pt, radius: 3pt, width: 100%,
  { set text(size: 0.9em); it },
)
#show link: set text(fill: rgb("#0f5e9c"))
