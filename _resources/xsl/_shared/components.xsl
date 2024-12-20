<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
<!ENTITY amp   "&#38;">
<!ENTITY copy   "&#169;">
<!ENTITY gt   "&#62;">
<!ENTITY hellip "&#8230;">
<!ENTITY laquo  "&#171;">
<!ENTITY lsaquo   "&#8249;">
<!ENTITY lsquo   "&#8216;">
<!ENTITY lt   "&#60;">
<!ENTITY nbsp   "&#160;">
<!ENTITY quot   "&#34;">
<!ENTITY raquo  "&#187;">
<!ENTITY rsaquo   "&#8250;">
<!ENTITY rsquo   "&#8217;">
]>

<!--
Implementation Skeleton - 10/12/2019
Global Components XSL
This file contains templates and functions that control default behavior for standard OU Components
-->

<xsl:stylesheet version="3.0"
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:xs="http://www.w3.org/2001/XMLSchema"
				xmlns:fn="http://www.w3.org/2005/xpath-functions"
				xmlns:ou="http://omniupdate.com/XSL/Variables"
				xmlns:ouc="http://omniupdate.com/XSL/Variables"
				exclude-result-prefixes="xs ou fn ouc">

	<!-- A template match for getting rid of the stray P element that wraps around a component when it is in Blue Pill Mode -->
	<xsl:template match="p[ouc:component][text()[normalize-space(.)] => empty()][count(element()) = 1]">
		<xsl:apply-templates select="element()"/>
	</xsl:template>

	<!-- Create a mode for working with OU standard component practices -->
	<xsl:mode name="ouc-component" on-no-match="shallow-copy"/>

	<!-- A match for ouc:component element in the unnamed namespace. This match changes the mode name to ouc-component. -->
	<xsl:template match="ouc:component">		
		<xsl:apply-templates mode="ouc-component"/>
	</xsl:template>
	<xsl:template match="@data-ouc-test" mode="ouc-component"/>
	<xsl:template match="element()[@data-ouc-test and normalize-space(@data-ouc-test) = '']" mode="ouc-component"/>
	<xsl:template match="@data-ouc-not" mode="ouc-component"/>
	<xsl:template match="element()[normalize-space(@data-ouc-not) != '']" mode="ouc-component"/>
	<xsl:template match="element()[@data-ouc-justedit]" mode="ouc-component"/>

	<!-- Testimonial Carousel Component -->
	<xsl:template match="ouc:component[@name='testimonial-carousel']">
		<div class="hccc-bs">
			<section class="hccc-bs-testimonials">
				<div class="container">
					<div id="testimonialCarousel" class="carousel slide" data-bs-ride="carousel" data-bs-pause="hover" data-bs-keyboard="true">
						<!-- Indicators -->
						<div class="carousel-indicators">
							<xsl:for-each select=".//article[contains(@class, 'carousel-item')]">
								<button type="button" data-bs-target="#testimonialCarousel" data-bs-slide-to="{position()-1}">
									<xsl:if test="position()=1">
										<xsl:attribute name="class">active</xsl:attribute>
										<xsl:attribute name="aria-current">true</xsl:attribute>
									</xsl:if>
									<xsl:attribute name="aria-label">Slide <xsl:value-of select="position()"/></xsl:attribute>
								</button>
							</xsl:for-each>
						</div>

						<div class="carousel-inner">
							<xsl:for-each select=".//article[contains(@class, 'carousel-item')]">
								<div class="carousel-item{if (position()=1) then ' active' else ''}" data-bs-interval="10000">
									<article class="hccc-bs-testimonial-item">
										<div class="row">
											<div class="col-md-4 hccc-bs-testimonial-image-wrapper">
												<img class="hccc-bs-testimonial-image rounded-circle" 
													src="{.//img/@src}" 
													alt="{.//img/@alt}" 
													loading="lazy"/>
											</div>
											<div class="col-md-8">
												<blockquote class="hccc-bs-testimonial-content">
													<p class="hccc-bs-testimonial-quote">
														<xsl:value-of select=".//p[@class='hccc-bs-testimonial-quote']/text()"/>
													</p>
													<footer class="hccc-bs-testimonial-author">
														<xsl:value-of select=".//footer[@class='hccc-bs-testimonial-author']/text()"/>
													</footer>
												</blockquote>
											</div>
										</div>
									</article>
								</div>
							</xsl:for-each>
						</div>

						<!-- Controls -->
						<button class="carousel-control-prev" type="button" data-bs-target="#testimonialCarousel" data-bs-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Previous</span>
						</button>
						<button class="carousel-control-next" type="button" data-bs-target="#testimonialCarousel" data-bs-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Next</span>
						</button>
					</div>
				</div>
			</section>
		</div>
	</xsl:template>
</xsl:stylesheet>