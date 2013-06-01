<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Capstone2013_HGP._Default" %>



<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        var currentPosition = 0;
        var slideWidth = 560;
        var slides = $('.slide');
        var numberOfSlides = slides.length;

        // Remove scrollbar in JS
        $('#slidesContainer').css('overflow', 'hidden');

        // Wrap all .slides with #slideInner div
        slides
          .wrapAll('<div id="slideInner"></div>')
          // Float left to display horizontally, readjust .slides width
          .css({
              'float': 'left',
              'width': slideWidth
          });

        // Set #slideInner width equal to total width of all slides
        $('#slideInner').css('width', slideWidth * numberOfSlides);

        // Insert controls in the DOM
        $('#slideshow')
          .prepend('<span class="control" id="leftControl">Clicking moves left</span>')
          .append('<span class="control" id="rightControl">Clicking moves right</span>');

        // Hide left arrow control on first load
        manageControls(currentPosition);

        // Create event listeners for .controls clicks
        $('.control')
          .bind('click', function () {
              // Determine new position
              currentPosition = ($(this).attr('id') == 'rightControl') ? currentPosition + 1 : currentPosition - 1;

              // Hide / show controls
              manageControls(currentPosition);
              // Move slideInner using margin-left
              $('#slideInner').animate({
                  'marginLeft': slideWidth * (-currentPosition)
              });
          });

        // manageControls: Hides and Shows controls depending on currentPosition
        function manageControls(position) {
            // Hide left arrow if position is first slide
            if (position == 0) { $('#leftControl').hide() } else { $('#leftControl').show() }
            // Hide right arrow if position is last slide
            if (position == numberOfSlides - 1) { $('#rightControl').hide() } else { $('#rightControl').show() }
        }
    });
</script>
<style type="text/css">
<!--
/** 
 * Slideshow style rules.
 */
#slideshow {
	margin:0 auto;
	width:960px;
	height:263px;
	background:transparent url(img/bg_slideshow.jpg) no-repeat 0 0;
	position:relative;
}
#slideshow #slidesContainer {
  margin:0 auto;
  width:560px;
  height:263px;
  overflow:auto; /* allow scrollbar */
  position:relative;
}
#slideshow #slidesContainer .slide {
  margin:0 auto;
  width:540px; /* reduce by 20 pixels of #slidesContainer to avoid horizontal scroll */
  height:263px;
}

/** 
 * Slideshow controls style rules.
 */
.control {
  display:block;
  width:39px;
  height:263px;
  text-indent:-10000px;
  position:absolute;
  cursor: pointer;
}
#leftControl {
  top:0;
  left:0;
  background:transparent url(Images/control_left.jpg) no-repeat 0 0;
}
#rightControl {
  top:0;
  right:0;
  background:transparent url(Images/control_right.jpg) no-repeat 0 0;
}
-->
</style>
    <section class="featured">
        <div class="content-wrapper">
            <div id="pageContainer">
                <h1>Upcoming Events:</h1>
  <!-- Slideshow HTML -->
                <div id="slideshow">
                    <div id="slidesContainer">
                        <div class="slide">
                            <img src="Images/Kid_Rock.jpg" />
                            <p>Kid Rock is coming to Nashville! He will be at the Bridgestone Arena July 16th 2015. Reserve your tickets today!</p>
                        </div>
                        <div class="slide">
                            <img style="max-height:300px; max-width:300px; padding-right:5px; float:left;" src="Images/Taylor_Swift.jpg" />
                            <p>Reserve your tickets now for Taylor Swift in Louisville, Kentucky on May 4th 2015 at the KFC Yum! Center!</p>
                        </div>
                        <div class="slide">
                            <img style="max-height:300px; max-width:300px; padding-right:5px; float:left;" src="Images/Tim-McGraw-Tour.jpg" />
                            <p>Tim McGraw is coming back! Check for tickets in your area for the Freedom Tour 2013!</p>
                        </div>
                        <div class="slide">
                            <img style="max-height:300px; max-width:200px; padding-left:5px; float:right;" src="Images/j_timberlake1_300_400.jpg" />
                            <p>Come see Justin Timberlake LIVE in concert for his reunion tour with NSYNC! Check for tickets in your area today!</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <p>Welcome to the Home Grown Productions Event website. Where you can purchase tickets for all of the hot upcoming events hosted by Home Grown Productions.
        Please check out the events page for ticket purchases. Also, we offer discounts for those who would like to become a preferred member. Registration is free!
    </p>
</asp:Content>
