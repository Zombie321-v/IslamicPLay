---
name: Royal Islamic Luxury
colors:
  surface: '#131313'
  surface-dim: '#131313'
  surface-bright: '#393939'
  surface-container-lowest: '#0e0e0e'
  surface-container-low: '#1c1b1b'
  surface-container: '#201f1f'
  surface-container-high: '#2a2a2a'
  surface-container-highest: '#353534'
  on-surface: '#e5e2e1'
  on-surface-variant: '#e1bfba'
  inverse-surface: '#e5e2e1'
  inverse-on-surface: '#313030'
  outline: '#a88a86'
  outline-variant: '#59413e'
  surface-tint: '#ffb4aa'
  primary: '#ffb4aa'
  on-primary: '#690004'
  primary-container: '#860d0d'
  on-primary-container: '#ff8e81'
  inverse-primary: '#af2e26'
  secondary: '#e9c349'
  on-secondary: '#3c2f00'
  secondary-container: '#af8d11'
  on-secondary-container: '#342800'
  tertiary: '#f7bd48'
  on-tertiary: '#412d00'
  tertiary-container: '#573d00'
  on-tertiary-container: '#dba531'
  error: '#ffb4ab'
  on-error: '#690005'
  error-container: '#93000a'
  on-error-container: '#ffdad6'
  primary-fixed: '#ffdad5'
  primary-fixed-dim: '#ffb4aa'
  on-primary-fixed: '#410001'
  on-primary-fixed-variant: '#8d1412'
  secondary-fixed: '#ffe088'
  secondary-fixed-dim: '#e9c349'
  on-secondary-fixed: '#241a00'
  on-secondary-fixed-variant: '#574500'
  tertiary-fixed: '#ffdea6'
  tertiary-fixed-dim: '#f7bd48'
  on-tertiary-fixed: '#271900'
  on-tertiary-fixed-variant: '#5d4200'
  background: '#131313'
  on-background: '#e5e2e1'
  surface-variant: '#353534'
typography:
  headline-xl:
    fontFamily: Playfair Display
    fontSize: 48px
    fontWeight: '700'
    lineHeight: '1.2'
    letterSpacing: -0.02em
  headline-lg:
    fontFamily: Playfair Display
    fontSize: 32px
    fontWeight: '600'
    lineHeight: '1.3'
  headline-md:
    fontFamily: Playfair Display
    fontSize: 24px
    fontWeight: '500'
    lineHeight: '1.4'
  body-lg:
    fontFamily: Newsreader
    fontSize: 18px
    fontWeight: '400'
    lineHeight: '1.6'
  body-md:
    fontFamily: Newsreader
    fontSize: 16px
    fontWeight: '400'
    lineHeight: '1.6'
  label-sm:
    fontFamily: Montserrat
    fontSize: 12px
    fontWeight: '600'
    lineHeight: '1.2'
    letterSpacing: 0.1em
rounded:
  sm: 0.125rem
  DEFAULT: 0.25rem
  md: 0.375rem
  lg: 0.5rem
  xl: 0.75rem
  full: 9999px
spacing:
  unit: 8px
  container-max: 1280px
  gutter: 24px
  margin-desktop: 64px
  margin-mobile: 20px
---

## Brand & Style

This design system is a digital expression of the serene opulence found within Islamic architectural masterpieces. It targets a discerning audience seeking a high-end, spiritual, and cinematic experience. The brand personality is authoritative yet tranquil, combining the weight of tradition with the ethereal quality of modern digital interfaces.

The visual style is a sophisticated blend of **Glassmorphism** and **Skeuomorphic textures**. It utilizes translucent layers to mimic frosted glass windows in a palace, while employing sharp gold accents and intricate geometric patterns to ground the experience in physical luxury. The mood is intentionally dark and immersive, allowing gold and red elements to "glow" as if illuminated by candlelight within a dimly lit hall.

## Colors

The palette is rooted in the "Royal Dark" aesthetic. 

- **Primary (Royal Red):** A deep, saturated crimson used for focal points, primary actions, and meaningful highlights. It evokes passion and spiritual depth.
- **Secondary (Metallic Gold):** A vibrant, lustrous gold used for borders, iconography, and decorative filigree. This color should often be applied as a linear gradient to simulate metallic reflection.
- **Neutral (Matte Charcoal & Black):** The foundation of the system. Surfaces use a matte charcoal (#121212) to provide depth, while the absolute background is pure black to maximize the contrast of the "glowing" elements.
- **Accent (Sunlight Gold):** A lighter, brighter gold (#F9E498) used sparingly for high-intensity glows and active states.

## Typography

Typography in this design system emphasizes a literary and editorial feel. 

**Playfair Display** is the cornerstone font, used for all headlines to convey elegance and historical weight. **Newsreader** provides a highly legible, sophisticated serif experience for long-form body text, maintaining the "sacred text" aesthetic. **Montserrat** is introduced for labels, buttons, and navigation elements to provide a clean, modern contrast and ensure high functional clarity at small sizes.

For mobile layouts, `headline-xl` should scale down to 36px to ensure visual hierarchy without overwhelming the viewport.

## Layout & Spacing

The layout follows a **Fixed Grid** philosophy, drawing inspiration from the structured symmetry of Islamic art and the margins of illuminated manuscripts.

- **Desktop:** A 12-column grid with generous 64px outer margins to create a sense of exclusivity and breathing room.
- **Tablet:** An 8-column grid with 40px margins.
- **Mobile:** A 4-column grid with 20px margins.

Spacing follows an 8px base unit. Larger gaps (48px+) should be used between major sections to emphasize the cinematic pacing of the content. Elements should often be centered to reflect the bilateral symmetry common in palace architecture.

## Elevation & Depth

Hierarchy is established through "Light and Layering" rather than traditional drop shadows.

1.  **Base Layer:** Solid Matte Charcoal or Black.
2.  **Middle Layer (Glassmorphism):** Semi-transparent surfaces (10-20% opacity) with a high backdrop blur (20px-40px). These represent the "frosted glass" partitions.
3.  **Accent Layer:** These surfaces are bounded by 1px gold borders. 
4.  **Luminosity:** Instead of black shadows, use "Gold Glows." Higher elevation elements have a subtle outer glow using the secondary gold color at very low opacity (10%), creating a halo effect that suggests the element is back-lit.

## Shapes

The shape language is "Architectural Precision." While the base roundedness is set to `1` (Soft) to avoid an overly clinical feel, specific decorative elements utilize complex geometric clipping.

- **Standard Containers:** 4px (0.25rem) corner radius.
- **Feature Cards:** May use a "pointed arch" or "ogee" top border to mimic palace doorways.
- **Patterns:** Subtle Islamic geometric patterns (star-and-cross) should be used as low-opacity masks within backgrounds or as decorative dividers. These patterns must remain subtle to avoid cluttering the UI.

## Components

### Buttons
Primary buttons use a Deep Royal Red background with a subtle gold inner-border. The text is Montserrat Bold in White or Gold. On hover, the gold border gains a soft outer glow. Secondary buttons are "ghost" style with a 1px Gold border and transparent background.

### Cards
Cards are the primary use case for glassmorphism. They feature a 1px Gold border and a backdrop blur. The header of the card often features a thin, horizontal gold filigree line to separate it from the body content.

### Inputs
Text fields are dark-filled with a gold bottom-border only. Upon focus, the bottom border animates to a slightly thicker gold line with a faint upward glow. Labels use Montserrat in a muted gold or grey.

### Dividers
Standard line dividers are replaced by ornate "Gold Filigree" lines. These are thin gold lines that feature a small geometric icon (like an 8-pointed star) in the center.

### Navigation
Top navigation is fixed and utilizes a heavy backdrop blur. Navigation links use Montserrat with increased letter spacing. The "active" state is indicated by a small gold dot or star beneath the menu item.