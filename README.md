# 🏛️ Architecture Visual Assets

The **architecture-visual-assets** repository is the central source of truth for the CGD DSI Architecture Team. It hosts visual assets designed for reuse across CGD’s technical documentation, Confluence pages, and architectural reviews.

---

## 🚀 Quick Start
* **Browsing:** Use the [GitHub Pages Microsite](https://ptcgd.github.io/architecture-visual-assets/) for a searchable, zoomed-in experience.
* **Media:** Visit the [Media Library](https://ptcgd.github.io/architecture-visual-assets/#/media_catalog) to find common icons and logos.
* **Formats:** 
    * **Draw.io:** Saved as `.drawio.svg` (Editable SVG).
    * **Mermaid:** Documentation-embedded diagrams using `.md`.

---

## 📂 Repository Structure

```text

📦 architecture-visual-assets
 ┣ 📂 blueprints
 ┣ 📂 g-team
 ┣ 📂 media
 ┃ ┣ 📂 cgdiconlib
 ┃ ┗ 📂 gcp
 ┣ 📂 p-ativos-financeiros
 ┣ 📂 p-clientes-contas
 ┣ 📂 p-credito
 ┣ 📂 p-dados
 ┣ 📂 p-network-infrastructure
 ┣ 📂 p-pagamentos
 ┣ 📂 p-tech
 ┣ 📂 p-suporte-empresarial
 ┣ 📂 t-application-architecture
 ┣ 📂 t-business-architecture
 ┣ 📂 t-data-architecture
 ┗ 📂 t-technology-architecture
```
```text
blueprints: diagrams used in the context of blueprints
g-team: diagrams used for team management or internal iniciatives
media: icons and other images. Galery available at Home / Media Library
p-ativos-financeiros: pilar de ativos financeiros (carteira própria, carteira clientes e mercados)
p-clientes-contas: pilar de clientes e contas (AML, CRM, Clientes e Passivas/Contas)
p-credito: pilar de crédito
p-dados: pilar dados, engloba projetos da área de dados
p-network-infrastructure: (não existe este pilar) engloba diagramas de infraestrutura e rede
p-pagamentos: pilar de Cartões, Acquiring e Transferências
p-tech: (não existe este pilar) agrega diagramas de iniciativas da DSI / tecnologia
p-suporte-empresarial: pilar suporte empresarial (Gesarq, meta4... distribuídos)
t-application-architecture: diagrams that visualize the (togaf) application architecture
t-business-architecture: diagrams that visualize the (togaf) business architecture
t-data-architecture: diagrams that visualize (togaf) data architecture
t-technology-architecture: diagrams concerning (togaf) technology architecture
```

---

## 🛠️ How to Contribute
Clone the repo to `C:\repos\`

Edit using VS Code with the Draw.io Integration extension.

Save as `.drawio.svg` with "Include copy of diagram" checked.

Run `.\update-assets.ps1` to refresh the sidebar and search index.

**Commit & Push** to see changes live on the microsite.
