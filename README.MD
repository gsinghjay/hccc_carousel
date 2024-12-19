# Bootstrap Carousel Documentation

## Overview
This documentation details a Bootstrap-based testimonial carousel implementation that follows SOLID principles and maintains compatibility with a CMS using the `hccc-bs` namespace.

## Structure

### HTML Components
```html
<div class="hccc-bs">                          <!-- CMS Namespace wrapper -->
    <section class="hccc-bs-testimonials">      <!-- Main section -->
        <div class="container">                 <!-- Bootstrap container -->
            <h2>...</h2>                        <!-- Section heading -->
            <div id="testimonialCarousel">      <!-- Carousel wrapper -->
                <!-- Carousel components -->
            </div>
        </div>
    </section>
</div>
```

### Key Components

1. **Carousel Container**
   ```css
   #testimonialCarousel {
       padding: 0 50px;  /* Space for navigation arrows */
   }
   ```
   - Provides padding for navigation arrows
   - Ensures content doesn't overlap with controls

2. **Navigation Controls**
   ```css
   .carousel-control-prev, .carousel-control-next {
       width: 40px;
       /* Positioned absolutely relative to carousel container */
   }
   ```
   - Fixed width navigation buttons
   - Positioned outside the main content area

3. **Content Area**
   ```css
   .carousel-inner {
       min-height: 300px;  /* Consistent height */
   }
   
   .carousel-item {
       height: 100%;
   }
   ```
   - Maintains consistent height across slides
   - Prevents layout shifts during transitions

4. **Testimonial Content**
   ```css
   .hccc-bs-testimonial-content {
       padding: 20px;
       overflow-y: auto;
       max-height: 250px;
   }
   ```
   - Scrollable content area for longer testimonials
   - Consistent padding and spacing

## XML Integration

### XML Structure
```xml
<timeline>
    <year value="YYYY">
        <event>
            <date>...</date>
            <title>...</title>
            <description>...</description>
            <image>...</image>
        </event>
    </year>
</timeline>
```

### Mapping XML to Carousel
- `event` elements map to carousel items
- `title` becomes testimonial author
- `description` becomes testimonial quote
- `image` maps to testimonial image

## Features

1. **Accessibility**
   - Keyboard navigation support (`data-bs-keyboard="true"`)
   - ARIA labels for controls
   - Screen reader support
   - Visible indicators

2. **User Experience**
   - Auto-pause on hover (`data-bs-pause="hover"`)
   - 10-second intervals between slides
   - Smooth transitions
   - Consistent height prevents layout shifts

3. **Responsive Design**
   - Image wrapper maintains aspect ratio
   - Flexible grid system
   - Mobile-friendly layout

4. **Performance**
   - Lazy loading of images
   - Optimized transitions
   - Controlled content height

## CSS Class Reference

```css
.hccc-bs-testimonials {
    /* Main section styling */
    padding: 2rem 0;
    background-color: #2b3990;
}

.hccc-bs-testimonial-image-wrapper {
    /* Image container styling */
    display: flex;
    justify-content: center;
    align-items: center;
}

.hccc-bs-testimonial-image {
    /* Image dimensions and spacing */
    width: 200px;
    height: 200px;
    margin-bottom: 15px;
}

.hccc-bs-testimonial-content {
    /* Content area styling */
    padding: 20px;
    overflow-y: auto;
    max-height: 250px;
}
```

## Best Practices

1. **Namespace Consistency**
   - Maintain `hccc-bs-` prefix for all custom classes
   - Keep Bootstrap classes unchanged

2. **Content Management**
   - Use semantic HTML elements
   - Maintain consistent image sizes
   - Keep testimonial lengths reasonable

3. **Performance**
   - Optimize images
   - Use lazy loading
   - Maintain consistent heights

4. **Accessibility**
   - Include alt text for images
   - Maintain keyboard navigation
   - Provide screen reader support

## Browser Support
- Compatible with modern browsers
- Bootstrap 5.3.1 dependencies
- Responsive across devices

This implementation provides a robust, accessible, and maintainable solution for displaying testimonials in a carousel format, while maintaining compatibility with XML data structures and CMS integration.