<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="1.0">

	<!-- this XSL stylesheet matches the <JavacoTea> tag in an associated XML 
		file and replaces it with the HTML contents of the template. -->

	<xsl:template match="/">
		<html>
			<head>
				<title>Students Record</title>
				<link rel="stylesheet" href="css/normalize.css" />
				<link rel="stylesheet" href="css/skeleton.css" />
				<link rel="stylesheet" href="css/main.css" />
			</head>
			<body>

				<xsl:for-each select="/students/student">

					<!-- Student Container -->
					<div class="container container-student">
						<!-- Personal Details Header -->
						<h3>Personal Details</h3>
						<!-- Personal Details Row -->
						<div class="row">
							<!-- Personal Details Column Photo -->
							<div class="three columns">
								<img src="{personaldetails/photo}" />
							</div>
							<!-- End Personal Details Column Photo -->
							<!-- Personal Details Column General Details -->
							<div class="six columns">
								<ul class="ul-nospace">
									<li>
										<b>Student ID: </b>
										<xsl:value-of select="personaldetails/id" />
									</li>
									<li>
										<b>Title :</b>
										<xsl:value-of select="personaldetails/title" />
									</li>
									<li>
										<b>Surname: </b>
										<xsl:value-of select="personaldetails/name[@type='surname']" />
									</li>
									<li>
										<b>Preferred Given Name: </b>
										<xsl:value-of select="personaldetails/name[@type='preferred_given']" />
									</li>
									<li>
										<b>Given Name: </b>
										<xsl:value-of select="personaldetails/name[@type='surname']" />
									</li>
									<li>
										<b>Gender: </b>
										<xsl:value-of select="personaldetails/gender" />
									</li>
									<li>
										<b>Date of Birth: </b>
										<xsl:value-of select="personaldetails/dob" />
									</li>
									<li>
										<b>Email: </b>
										<xsl:value-of select="personaldetails/email" />
									</li>
								</ul>
							</div>
							<!-- End Personal Details Column General Details -->

							<!-- Personal Details Column Course Enrolled -->
							<div class="three columns">
								<table>
									<thead>
										<tr>
											<th>Course Code</th>
											<th>Course Status</th>
										</tr>
									</thead>
									<tbody>
										<xsl:for-each select="courses/course">
											<!-- Course Row -->
											<tr>
												<!-- Course Code td -->
												<td>
													<i>
														<xsl:value-of select="text()" />
													</i>
												</td><!-- End Course Code td -->

												<!-- Course Status td -->
												<td>
													<xsl:value-of select="@status" />
												</td><!-- End Course Status td -->

												<!-- Course Status td -->
											</tr>
											<!-- End Course Row -->
										</xsl:for-each>
									</tbody>
								</table>
							</div>
							<!-- End Personal Details Column Course Enrolled -->
						</div>
						<!-- End Personal Details Row -->


						<!-- Address Detail Container -->
						<div class="container-address">
							<h3>Addresses</h3>

							<!-- Looping Through Address -->
							<xsl:for-each select="addresses/address">
								<h5>
									<xsl:value-of select="@type" />
									Address
								</h5>
								<!-- Correspondence Address Row -->
								<div class="row row-home">
									<!--Correspondence Address Column Address -->
									<div class="six columns">
										<ul class="ul-nospace">
											<li>
												<b>Start Date: </b>
												<xsl:value-of select="start_date" />
											</li>
											<li>
												<b>Address Line: </b>
												<xsl:value-of select="address_line" />
											</li>
											<li>
												<b>Suburb: </b>
												<xsl:value-of select="suburb" />
											</li>
											<li>
												<b>Post Code: </b>
												<xsl:value-of select="post_code" />
											</li>
										</ul>
									</div>
									<!--End Correspondence Address Column Address -->
									<!--Correspondence Address Column Contact -->
									<div class="six columns">
										<ul class="ul-nospace">
											<li>
												<b>Home Phone No.: </b>
												<xsl:value-of select="number[@type='home']" />
											</li>
											<li>
												<b>Mobile Phone No.: </b>
												<xsl:value-of select="number[@type='mobile']" />
											</li>
											<li>
												<b>Work Phone No.: </b>
												<xsl:value-of select="number[@type='work']" />
											</li>
											<li>
												<b>Fax No.: </b>
												<xsl:value-of select="number[@type='fax']" />
											</li>
										</ul>
									</div>
									<!--End Correspondence Address Column Contact -->
								</div>
								<!-- End Correspondence Address -->
							</xsl:for-each>

						</div>
						<!-- End Address Detail Container -->


					</div>
					<!-- End Student Container -->
				</xsl:for-each>
			</body>
		</html>
	</xsl:template>

</xsl:stylesheet>
