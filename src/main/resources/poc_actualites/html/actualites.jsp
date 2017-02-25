<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr"%>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib"%>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions"%>
<%@ taglib prefix="query" uri="http://www.jahia.org/tags/queryLib"%>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib"%>
<%@ taglib prefix="s" uri="http://www.jahia.org/tags/search"%>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>

<template:addResources type="css" resources="bootstrap.css" />
<template:addResources type="css" resources="actualites.css" />
<template:addResources type="javascript" resources="jquery-3.1.1.min.js" />
<template:addResources type="javascript" resources="bootstrap.js" />

<div class="container">
	<div
		<c:if test="${editableModule and renderContext.editModeConfigName eq 'studiomode'}">
    <c:url var="background" value="${url.currentModule}/img/960_16_10_10.png"/>
    style="background-color: #FFFFFF;background-image: url('${background}');background-repeat: repeat-y;"
</c:if>
		class="row">

		<!--Actu de gauche-->
		<div class='col-sm-4'>
			<template:area path="GAUCHE" areaAsSubNode="true"
				nodeTypes="poc:actu" />
			<!-- "GAUCHE_${fn:replace(currentNode.identifier,'-','_')}" -->
			<c:if test="${pageScope['org.jahia.emptyArea']}">
                        &nbsp;&nbsp;
                    </c:if>
			<div class='clear'></div>
		</div>

		<!--Actu du milieu-->
		<div class='col-sm-4'>
			<template:area path="MILIEU" areaAsSubNode="true"
				nodeTypes="poc:actu" />
			<c:if test="${pageScope['org.jahia.emptyArea']}">
                        &nbsp;&nbsp;
                    </c:if>
			<div class='clear'></div>
		</div>

		<!--Actu de droite-->
		<div class='col-sm-4'>
			<template:area path="DROITE" areaAsSubNode="true"
				nodeTypes="poc:actu" />
			<c:if test="${pageScope['org.jahia.emptyArea']}">
                        &nbsp;&nbsp;
                    </c:if>
			<div class='clear'></div>
		</div>

		<div class='clear'></div>

		<!-- Modale commune aux 3 actus -->
		<div id="myModal" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">D&eacute;tail</h4>
					</div>
					<div class="modal-body">

						<div id="tmp"></div>

						<jcr:sql var="resultats"
							sql="select * from [poc:actu] where isdescendantnode('/sites/actualites/home')" />


						<div id="carousel${currentNode.identifier}"
							class="carousel slide slider">
							<ol class="carousel-indicators">
								<c:forEach items="${resultats.nodes}" var="item"
									varStatus="status">
									<li data-target="#carousel${currentNode.identifier}"
										data-slide-to="${status.index}"
										class="${status.index eq 0?'active':''}"></li>
									<c:set var="carouselInner">${carouselInner}

										<div id="${item.identifier}" class="item">
											<template:module node="${item}" view="detail" />

										</div>
									</c:set>
								</c:forEach>
							</ol>
							<div class="carousel-inner actudetail_cadre">${carouselInner}</div>
							<a class="carousel-control left"
								href="#carousel${currentNode.identifier}" data-slide="prev">&lsaquo;</a>
							<a class="carousel-control right"
								href="#carousel${currentNode.identifier}" data-slide="next">&rsaquo;</a>
						</div>





					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Fermer</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>