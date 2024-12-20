# Bootstrap Carousel Documentation

## Overview
This documentation details a Bootstrap-based testimonial carousel implementation specifically designed for OmniUpdate CMS integration, using namespaced classes to prevent style conflicts.

## Implementation Details

### 1. CMS Component Structure
```xml
<ouc:component label="Testimonial Carousel" name="hccc-testimonial-carousel">
    <div class="hccc-bs">
        <section class="hccc-bs-testimonials">
            <div class="container">
                <div id="hcccTestimonialCarousel" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-inner">
                        <article class="hccc-bs-testimonial-item carousel-item active">
                            <div class="row">
                                <div class="col-md-4 hccc-bs-testimonial-image-wrapper">
                                    <img class="hccc-bs-testimonial-image rounded-circle" src="[[IMAGE]]" alt="[[NAME]]" data-ouc-test="[[IMAGE]]" />
                                </div>
                                <div class="col-md-8">
                                    <blockquote class="hccc-bs-testimonial-content">
                                        <p class="hccc-bs-testimonial-quote">[[QUOTE]]</p>
                                        <footer class="hccc-bs-testimonial-author">[[NAME]]</footer>
                                    </blockquote>
                                </div>
                            </div>
                        </article><article class="hccc-bs-testimonial-item carousel-item ">
                            <div class="row">
                                <div class="col-md-4 hccc-bs-testimonial-image-wrapper">
                                    <img class="hccc-bs-testimonial-image rounded-circle" src="[[IMAGE]]" alt="[[NAME]]" data-ouc-test="[[IMAGE]]" />
                                </div>
                                <div class="col-md-8">
                                    <blockquote class="hccc-bs-testimonial-content">
                                        <p class="hccc-bs-testimonial-quote">[[QUOTE]]</p>
                                        <footer class="hccc-bs-testimonial-author">[[NAME]]</footer>
                                    </blockquote>
                                </div>
                            </div>
                        </article>
                    </div>
                </div>
            </div>
        </section>
    </div>
</ouc:component>
```

### 2. XSL Transformation
```xsl
<!-- _shared/components.xsl -->
<xsl:template match="ouc:component[@name='hccc-testimonial-carousel']">
    <!-- XSL transformation template -->
</xsl:template>
```

### 3. CSS Implementation
```css
/* _resources/css/testimonial-carousel.css */
.hccc-bs-testimonials {
    padding: 2rem 0;
    background-color: #2b3990;
    color: #fff;
}

/* Specific article styling to override CMS defaults */
.hccc-bs-testimonials article.hccc-bs-testimonial-item {
    padding: 0 20px;
    height: 100%;
    outline: none;
    border: none; /* Override custom.css border */
}
```

## Key Solutions

### 1. CMS Style Conflicts
- **Issue**: Generic article styling in custom.css adding unwanted borders
- **Solution**: Added more specific selectors in testimonial-carousel.css
```css
.hccc-bs-testimonials article.hccc-bs-testimonial-item {
    border: none;
}
```

### 2. Namespace Conflicts
- **Issue**: Bootstrap styles conflicting with CMS jQuery UI
- **Solution**: 
  - Added `hccc-bs` namespace prefix
  - Changed carousel ID to `hcccTestimonialCarousel`
  - Scoped all Bootstrap-related styles

### 3. Component Integration
- **Issue**: Need for editable fields in CMS
- **Solution**: 
  - Used `data-ouc-test` attributes
  - Implemented proper OmniUpdate component structure
  - Added placeholders with `[[VARIABLE]]` syntax

## Implementation Steps

1. **Component Setup**
   - Create component XML template
   - Define editable regions with `data-ouc-test`
   - Set up proper namespacing

2. **XSL Configuration**
   - Add transformation template to components.xsl
   - Configure proper node selection
   - Implement carousel logic

3. **CSS Integration**
   - Create namespaced styles
   - Override conflicting CMS styles
   - Maintain Bootstrap functionality

4. **Testing**
   - Verify CMS compatibility
   - Check style isolation
   - Validate carousel functionality

## Usage in CMS

1. **Adding the Component**
   ```html
   <ouc:div label="testimonial-carousel">
       <!-- Component will be transformed here -->
   </ouc:div>
   ```

2. **Editing Content**
   - Use image selector for testimonial images
   - Edit quote text and author name
   - Duplicate article sections for multiple slides

3. **Managing Styles**
   - All styles are contained in testimonial-carousel.css
   - No additional CSS required
   - Bootstrap styles are properly namespaced

## Best Practices

1. **CMS Integration**
   - Always use `ouc:component` structure
   - Maintain proper namespacing
   - Use data-ouc-test for editable fields

2. **Style Management**
   - Keep styles scoped to component
   - Use specific selectors to override CMS defaults
   - Maintain Bootstrap class naming conventions

3. **Performance**
   - Optimize image loading
   - Minimize style conflicts
   - Maintain clean component structure

## Dependencies
- Bootstrap 5.3.1
- OmniUpdate CMS
- Modern browser support

This implementation successfully resolves CMS conflicts while maintaining full carousel functionality and editor usability.