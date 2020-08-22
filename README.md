# **Statistical Analysis of Networks** ([syllabus]())


I teach a course on the statistical analysis of networks which provides a survey of the various tools for used in network analysis. The overarching goal of the course is that, upon completion, students will be capable of developing research questions from a network perspective and incorporating network-based tools in their own research. The course is designed to be primarily methodological, dedicating the majority of the time to working through the mechanics of network-based tools. Students will also gain experience with R, a commonly used software program for network data management, analysis, and visualization.

Even if you are not taking the course, feel free to browse the lecture notes and labs. As always, I welcome any feedback!

*Note on file formats*

For the labs, .html format and RMarkdown (.Rmd) format documents are provided. The .html files can be opened by first downloading the file and then opening it using any web browser. The .Rmd files can be opened in any web browser, but require [RStudio](https://www.rstudio.com/) to execute.


<br>

# *Lecture Notes and Labs*

## Introduction to Network Analysis

The introductory lecture covers the basics of network analysis: what it is, why we do it, etc. The learning goals of this lecture are to: 1) understand the difference between individual vs. network approaches to research and 2) introduce basic data elements in network analysis.

*Files*:
* Introduction lecture ([pdf](lectures/crj_605_networks_1_intro_slides.pdf)) & R script for Introduction lecture ([.R](lecture_syntax/intro.lecture.syntax.R))
* Raw course survey data ([Wave 1 .csv](data/crj_605_networks_spring_2019_class_survey_data_w1.csv)) ([Wave 2 .csv](data/crj_605_networks_spring_2019_class_survey_data_w2.csv)) ([Wave 1 & Wave 2 .csv](data/crj_605_networks_spring_2019_class_survey_data_w1_w2.csv))
* Course survey data instruments ([Wave 1 pdf](files/crj_605_networks_spring_2019_class_survey_w1.pdf)) (Wave 2 pdf)
* R script to clean raw course survey data ([Wave 1 .R](syntax/crj_605_networks_spring_2019_class_survey_w1_cleaning_syntax.R)) ([Wave 1 & 2 .R](syntax/crj_605_networks_spring_2019_class_survey_w1_w2_cleaning_syntax.R))
* Adjacency matrices for course survey data in .csv format:
   * Wave 1-
   ([Spend time net](data/crj_605_networks_spring_2019_spend_time_w1_adjacency.csv))
   ([Talk about course net](data/crj_605_networks_spring_2019_talk_course_w1_adjacency.csv))
   ([Trust net](data/crj_605_networks_spring_2019_trust_w1_adjacency.csv))
   ([TV net](data/crj_605_networks_spring_2019_tv_w1_adjacency.csv))
   * Wave 2-
   ([Spend time net](data/crj_605_networks_spring_2019_spend_time_w2_adjacency.csv))
   ([Talk about course net](data/crj_605_networks_spring_2019_talk_course_w2_adjacency.csv))
   ([Trust net](data/crj_605_networks_spring_2019_trust_w2_adjacency.csv))
* R data file with cleaned course survey data and network objects
([Wave 1 .rdata](data/crj_605_networks_spring_2019_class_survey_data_w1.rdata))
([Wave 1 & 2 .rdata](data/crj_605_networks_spring_2019_class_survey_data_w1_w2.rdata))

<br>
<hr>
<br>

## Network Data Structures and Sources of Network Data

These lectures cover the basics of using matrices to represent networks. Fundamental concepts of graph theory are also introduced. Also, various sources of network data are discussed. Special attention is given to the [Prison Inmate Network Study (PINS)](http://justicecenter.psu.edu/research/projects/%20prison-inmate-networks-study-pins) and the Boston Special Youth Project (SYP) Affiliation data.

*Files*:
* Data structures lecture ([pdf](lectures/crj_605_networks_2_data_structures_slides.pdf))
* Sources of data lecture ([pdf](lectures/crj_605_networks_3_sources_of_data_slides.pdf))
* R script for Data structures lecture ([.R](lecture_syntax/crj_605_networks_2_data_structures_syntax.R))

<br>
<hr>
<br>

## Getting Started with R and Network Visualization

This section starts working in [R](http://cran.r-project.org/) and focuses on three goals: First, an introduction to [R](http://cran.r-project.org/) (Intro to R lab) to familiarize users with [R](http://cran.r-project.org/). Second, an introduction to network analysis in [R](http://cran.r-project.org/) (Intro to Networks lab) covers how network objects are created and manipulated using the [sna](https://cran.r-project.org/web/packages/sna/index.html) package. Third, basic network visualization is reviewed (Visualization lab) using the [sna](https://cran.r-project.org/web/packages/sna/index.html) package.

*Files*:
* Intro to R lab ([html](labs/CRJ_605_Networks_1_INTRO_R_lab.html)) ([Rmd](labs/CRJ_605_Networks_1_INTRO_R_lab.Rmd))
* Intro to Networks lab (html) (Rmd)
* Visualization lab (html) (Rmd)
* Example networks used in labs (undirected network) (directed network)



<br>
<hr>
<br>

## Centrality
This lecture provides an introduction to centrality measures for individual nodes as well as centralization measures for graphs. In particular, the following centrality measures are described: degree, closeness, and betweenness. The accompanying labs (Degree Centrality Lab, Closeness & Betweenness Centrality Lab) provide an overview of these measures using the [sna](https://cran.r-project.org/web/packages/sna/index.html) package in [R](http://cran.r-project.org/). In addition, a problem set (with solutions) is provided to work through the material covered.

*Files*:
* Degree Centrality lecture (pdf) & R script for Degree Centrality lecture (.R)
* Degree Centrality lab (html) (Rmd)
* Degree Centrality problem set (pdf) and solutions (html) (Rmd)
* Closeness & Betweenness Centrality lecture (pdf) & R script for Closeness & Betweenness Centrality lecture (.R)
* Closeness & Betweenness Centrality lab (html) (Rmd)
* Betweenness Centrality problem set (pdf, see Part A) and solutions (html) (Rmd)

<br>
<hr>
<br>

## Cohesive Subgroups
This lecture provides an introduction to the conceptualization of cohesion in networks. The lecture examines various operationalizations of cohesion by examining definitions of subgroups. Specifically, the lecture covers cliques, n-cliques, k-cores, and community detection algorithms. The accompanying lab (Cohesive Subgroups Lab) provide an overview of these measures using the [igraph](https://igraph.org/redirect.html) and the [sna](https://cran.r-project.org/web/packages/sna/index.html) package in [R](http://cran.r-project.org/).

*Files*:
* Identifying Subgroups lecture (pdf) & R script for Identifying Subgroups lecture (.R)
* Cohesive Subgroups lab (html) (Rmd)

<br>
<hr>
<br>

## Bipartite Graphs/Two-Mode Networks
These lectures examine data that that are two-mode. That is, data in which objects in one modality (e.g. people) are connected through a second modality (e.g. clubs). The first lecture (Bipartite Graphs lecture) and the accompanying lab (Bipartite Graphs lab) provides an overview of how to create adjacency matrices from two-mode networks and how to analyze bipartite graphs. In addition, the second lecture and lab (Projection & Weighted Graphs lecture/lab) focus on projecting two-mode networks to one-mode (i.e. unipartite graphs) and the consequent weighting of edges that occurs. In addition, a problem set (with solutions) is provided to work through the material covered.

*Files*:
* Bipartite Graphs lecture (pdf)
* Bipartite Graphs lab (html) (Rmd)
* Two-mode edgelist (.csv) from Young & Ready (2015) used in Bipartite Graphs lecture & Bipartite Graphs lab
* Bipartite Graphs problem set (pdf, see Part B) and solutions (html) (Rmd)
* Projection & Weighted Graphs lecture (pdf)
* Projection & Weighted Graphs lab (html) (Rmd)

<br>
<hr>
<br>

## Exponential Random Graph Models (ERGMs)
These lectures examine the logic of generative models for network data. The first lecture (Introduction to ERGMs) introduces the exponential random graph model (ERGM) as a flexible tool for specifying network configurations that generate global network structures. The accompanying lab (Introduction to ERGMs lab) provides an overview of different dependence specifications of the model (e.g. dyadic independence) and working with node level attributes using the ergm package. The second lab (Simulation and Goodness of Fit) examines functions for goodness of fit and simulation in the ergm package. A comprehensive archive of materials, discussion, syntax, papers, etc. for the ergm package is available at the statnet website. In addition, a problem set (with solutions) is provided to work through the material covered.

*Files*:
* Introduction to ERGMs lecture (pdf) & R script for Introduction to ERGMs lecture (.R)
* Introduction to ERGMs lab (html) (Rmd)
* Simulation and Goodness of Fit lab (html) (Rmd)
* ERGMs problem set (pdf) and solutions (html) (Rmd)

<br>
<hr>
<br>

## Stochastic Actor-Based Models (SABMs)
These lectures examine the logic of simulation based models for network dynamics. Specifically, the stochastic actor-based model (SABM) is an approach to modeling change in network panel data. The first lecture discusses the basic logic of the model. The first lab (Introduction to SABMs) provides an overview the RSiena package by examining the evolution of an advice network among 75 MBA students (see http://www.stats.ox.ac.uk/~snijders/siena/ for details). The second lecture discusses co-evolution of networks and behavior. The second lab (Co-Evolution of Networks and Behavior) examines co-evolution using the RSiena package. A comprehensive archive of materials, discussion, syntax, papers, etc. for the RSiena package is available at the Siena website.

*Files*:
* Introduction to SABMs lecture (pdf)
* Introduction to SABMs lab (html) (Rmd)
     * Advice networks (W1 .csv) (W2 .csv) (W3 .csv) for lab
     * Attribute data (rating .csv) for lab
* Co-Evolution of Networks and Behavior lecture (pdf)
* Co-Evolution of Networks and Behavior lab (html) (Rmd)


<br>
<hr>
<br>
