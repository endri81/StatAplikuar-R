# Statistika e Aplikuar (MFM2S11)

Leksione javore 7-orëshe në formë workshop-i: Beamer (Singapore) + knitr + R.
Master në Inxhinieri Matematike · Departamenti i Inxhinierisë Matematike · FIMIF · UPT.
Titullari: Prof. Asoc. Dr. Endri Raço (eraco@fimif.edu.al)

## Struktura

| Dosja | Përmbajtja |
|---|---|
| `00_admin/` | Programi i lëndës (syllabusi + programi i shkurtuar 2025–2026), vendimet administrative |
| `01_template/` | Template-i Beamer Singapore dhe logot UPT/FIMIF |
| `02_data/` | CSV-të e përbashkëta të kursit dhe `README_datasets.md` |
| `03_weeks/week_NN/` | `week_NN_main.Rnw`, `week_NN_hourK.Rnw`, `week_NN_hourK_sol.Rnw` (K = 1..7), `week_NN_data/` |
| `04_slides_pdf/` | PDF-të e kompiluara, gati për studentët |
| `05_assessment/` | Detyra e kursit, projekti final, provimi përfundimtar (javët 10–12) |
| `06_references/` | Literatura dhe vinjetat e paketave |
| `07_scripts/` | Skriptet ndihmëse (kompilimi i një jave) |

## Ecuria

| Java | Tema | Rezultatet | Statusi |
|---|---|---|---|
| 01 | Hyrje në R dhe RStudio; vizualizimi bazë | S4 | ✅ gati (347 frame, 536 faqe PDF) |
| 02 | Statistikat përmbledhëse dhe EDA | K1, S4 | ✅ gati (299 frame, 552 faqe PDF) |
| 03 | Korrelacioni dhe bashkëshoqërimet | K1 | ✅ Gati (222 slide + 46 zgjidhje) |
| 04 | ANOVA njëfaktoriale dhe shumëfaktoriale, Tukey | K1, S3 | ✅ Gati (249 slide + 48 zgjidhje) |
| 05 | Regresi i thjeshtë linear | K2, S2 | ✅ Gati (216 slide + 48 zgjidhje) |
| 06 | Regresi i shumëfishtë, përzgjedhja, CV | K2, S2, S3 | ✅ Gati (184 slide + 45 zgjidhje) |
| 07 | Kontrolli i hipotezave dhe diagnostikimi | S3, C1 | ✅ Gati (217 slide + 43 zgjidhje) |
| 08 | Regresi jolinear dhe robust | K2, S2 | 🔄 Ora 1 gati (28 slide) |
| 09 | Regresi logjistik dhe klasifikimi (+ Zgjerim: pemët, RF) | K2, S3, C1 | ⏳ |
| 10 | Sistemet koordinative, projeksionet, datumet (`sf`) | K3 | ⏳ |
| 11 | Raster dhe vektor, shapefile (`sf`, `terra`) | K3, S4 | ⏳ |
| 12 | Interpolimi hapësinor, DTM, Kriging (`gstat`) + projekti final | K3, C1 | ⏳ |

## Kompilimi i një jave

```sh
./07_scripts/build_week.sh 01
```

Kërkon: R (`knitr`, `ggplot2`, `ISLR2`, `MASS`, `car`, `robustbase`, `sf`, `terra`, `gstat`, `sp`, `class`, `boot`, `splines`, `tree`, `randomForest`) dhe `pdflatex`.

## Burimet kryesore

- Kodi bazë: [NormanLo4319/DS612_Data_Mining_with_Business_Applications_R](https://github.com/NormanLo4319/DS612_Data_Mining_with_Business_Applications_R) (MIT), mbi ISLR.
- Temat jashtë repo-s (korrelacioni, ANOVA, regresi robust, analiza hapësinore) shënohen “Material plotësues”.
- Materiali përtej bërthamës së syllabusit (~4 h leksion + 2.5 h seminar në javë) shënohet “Zgjerim”.

## Të dhënat

- **Reale (burimi)**: `Advertising.csv` (faqja e ISLR, nuk është në paketën ISLR2), ISLR2 (Auto, Carseats, Default, Smarket), `MASS::Boston`, `meuse` (sp/gstat). INSTAT/Eurostat vetëm kur ngarkohen.
- **Sintetike**: parametrat e vërtetë në `02_data/README_datasets.md`; slide-et krahasojnë gjithmonë vlerësimin me të vërtetën.
