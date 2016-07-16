(TeX-add-style-hook
 "scheme"
 (lambda ()
   (TeX-run-style-hooks
    "latex2e"
    "report"
    "rep10"
    "amsmath"
    "graphicx"
    "color"
    "geometry"
    "hyperref"
    "amsfonts"
    "subcaption")
   (LaTeX-add-labels
    "eq:1"))
 :latex)

