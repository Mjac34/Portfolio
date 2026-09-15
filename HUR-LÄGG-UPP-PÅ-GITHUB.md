# Så lägger du upp portfolion på GitHub Pages

Det finns två sätt: **GitHub Desktop** (enklare, med knappar) eller **kommandoraden** (snabbare när du väl har en token). Välj det som känns mest lugnt.

---

## Först: uppdatera sidan med dina egna uppgifter

Öppna `index.html` och ändra:

- LinkedIn-länken på raden `<a href="https://www.linkedin.com" ...>`
- Mejladressen på raden `<a href="mailto:malin@example.com">`
- Byt ut texten i `<footer>` och "Om mig" om du vill

---

## Metod 1: GitHub Desktop (enklare)

1. **Ladda ner och installera** [GitHub Desktop](https://desktop.github.com/).
2. **Skapa ett nytt repo på GitHub**:
   - Gå till [github.com/new](https://github.com/new)
   - Repo-namn: `portfolio`
   - Välj **Public**
   - Klicka **Create repository**
3. **Klona repot** till din dator med GitHub Desktop.
4. **Kopiera innehållet i `Portfolio/`-mappen** in i det klonade repot.
   - Inte själva `Portfolio/`-mappen, utan filerna inuti (inklusive `index.html`, `style.css`, `README.md` och undermapparna).
5. I GitHub Desktop: skriv ett commit-meddelande, t.ex. `Första versionen av portfolion`.
6. Klicka **Commit to main** och sedan **Push origin**.
7. **Aktivera Pages**:
   - Gå till repot på GitHub
   - Inställningar → **Pages**
   - Under **Build and deployment** välj **Deploy from a branch**
   - Välj `main` och `/ (root)`
   - Klicka **Save**
8. Efter någon minut får du en länk: `https://dittanvändarnamn.github.io/portfolio`

---

## Metod 2: Kommandoraden (snabb)

### 1. Skapa ett Personal Access Token (PAT)

- Gå till [github.com/settings/tokens](https://github.com/settings/tokens)
- Klicka **Generate new token (classic)**
- Ge den ett namn, t.ex. `portfolio-deploy`
- Bocka för `repo`
- Klicka **Generate token**
- **Kopiera token:en** — du kan inte se den igen

### 2. Skapa repot

- [github.com/new](https://github.com/new)
- Namn: `portfolio`
- Public
- Klicka **Create repository**
- Kopiera HTTPS-länken, t.ex. `https://github.com/maali/portfolio.git`

### 3. Kör kommandona nedan

Öppna PowerShell och stå i mappen ovanför `Portfolio/`:

```powershell
# Gå in i Portfolio-mappen
cd "C:\Users\maali\OneDrive\Dokument\Portfolio"

# Initiera git
 git init

# Lägg till alla filer
git add .

# Commita
git commit -m "Första versionen av portfolion"

# Koppla till GitHub
git remote add origin https://github.com/DITT-ANVÄNDARNAMN/portfolio.git

# Pusha — du får skriva in användarnamn och token
# Använd token:en som lösenord
git push -u origin main
```

Om du får en fråga om lösenord, skriv:
- **Username**: ditt GitHub-användarnamn
- **Password**: token:en du kopierade

### 4. Aktivera Pages

Samma som i metod 1, steg 7.

---

## Viktigt att tänka på

- Repot måste vara **Public** för att GitHub Pages ska vara gratis.
- Adressen blir `https://dittanvändarnamn.github.io/portfolio`.
- Det tar 1–2 minuter innan sidan syns första gången.
- Om en bild eller länk inte fungerar, kontrollera att sökvägen stämmer med mappstrukturen i repot.
