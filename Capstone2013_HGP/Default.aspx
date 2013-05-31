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
				if (position == 0) {
					$('#leftControl').hide();
				} else {
					$('#leftControl').show();
				}
				// Hide right arrow if position is last slide
				if (position == numberOfSlides - 1) {
					$('#rightControl').hide();
				} else { $('#rightControl').show(); }
			}
		});
	</script>
	<style type="text/css">
		<!--
		/*Slideshow style rules.*/
		#slideshow
		{
			margin: 0 auto;
			width: 960px;
			height: 263px;
			position: relative;
		}

			#slideshow #slidesContainer
			{
				margin: 0 auto;
				width: 560px;
				height: 263px;
				overflow: auto; /* allow scrollbar */
				position: relative;
			}

				#slideshow #slidesContainer .slide
				{
					margin: 0 auto;
					width: 540px; /* reduce by 20 pixels of #slidesContainer to avoid horizontal scroll */
					height: 263px;
				}

		/*Slideshow controls style rules*/
		.control
		{
			display: block;
			width: 39px;
			height: 263px;
			text-indent: -10000px;
			position: absolute;
			cursor: pointer;
		}

		#leftControl
		{
			top: 0;
			left: 0;
			background: transparent url(Images/control_left.jpg) no-repeat 0 0;
		}

		#rightControl
		{
			top: 0;
			right: 0;
			background: transparent url(Images/control_right.jpg) no-repeat 0 0;
		}

		/* column container */
		.colmask
		{
			position: relative; /* This fixes the IE7 overflow hidden bug */
			clear: both;
			text-align: center;
			float: left;
			width: 100%; /*width of whole page*/
			/*overflow: hidden;*/ /*This chops off any overhanging divs*/
		}
		/*common column settings*/
		.colright,
		.colmid,
		.colleft
		{
			float: left;
			width: 100%; /*width of page*/
			position: relative;
		}

		.col1,
		.col2,
		.col3
		{
			float: left;
			position: relative;
			padding: 0 0 1em 0;
			overflow: hidden;
		}
		/*3 Column settings*/
		.threecol
		{
			background: #EFEEEF; /*right column background colour*/
		}

			.threecol .colmid
			{
				right: 33.3%; /*width of the right column*/
				background: #EFEEEF; /*center column background colour*/
			}

			.threecol .colleft
			{
				right: 33.4%; /*width of the middle column*/
				background: #EFEEEF; /*left column background colour*/
			}

			.threecol .col1
			{
				width: 29.4%; /*width of center column content (column width minus padding on either side)*/
				left: 100%; /*100% plus left padding of center column*/
			}

			.threecol .col2
			{
				width: 29.3%; /*Width of left column content (column width minus padding on either side)*/
				left: 35.3%; /*width of (right column) plus (center column left and right padding) plus (left column left padding)*/
			}

			.threecol .col3
			{
				width: 29.3%; /*Width of right column content (column width minus padding on either side)*/
				/*(100% - left column width) plus (center column left and right padding) 
					plus (left column left and right padding) plus (right column left padding)*/
				left: 76.7%;
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
							<img alt="Kid Rock" src="Images/Kid_Rock.jpg" />
							<p>Kid Rock is coming to Nashville! He will be at the Bridgestone Arena July 16th 2015. Reserve your tickets today!</p>
						</div>
						<div class="slide">
							<img alt="Taylor Swift" style="max-height: 300px; max-width: 300px; padding-right: 5px; float: left;" src="Images/Taylor_Swift.jpg" />
							<p>Reserve your tickets now for Taylor Swift in Louisville, Kentucky on May 4th 2015 at the KFC Yum! Center!</p>
						</div>
						<div class="slide">
							<img alt="Tim McGraw" style="max-height: 300px; max-width: 300px; padding-right: 5px; float: left;" src="Images/Tim-McGraw-Tour.jpg" />
							<p>Tim McGraw is coming back! Check for tickets in your area for the Freedom Tour 2013!</p>
						</div>
						<div class="slide">
							<img alt="Justin Timberlake" style="max-height: 300px; max-width: 200px; padding-left: 5px; float: right;" src="Images/j_timberlake1_300_400.jpg" />
							<p>Come see Justin Timberlake LIVE in concert for his reunion tour with NSYNC! Check for tickets in your area today!</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</asp:Content>