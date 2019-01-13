<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
  <head>
    <meta charset="UTF-8">
    <title>관리자 페이지</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- Bootstrap 3.3.4 -->
    <link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons -->
    <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
    <link href="/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
  </head>
      <!-- jQuery 2.1.4 -->
    <script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
  <body class="skin-blue sidebar-mini">
    <div class="wrapper">
      
      <header class="main-header">
        <!-- Logo -->

        <a href="/admin.do" class="logo">
          <!-- logo for regular state and mobile devices -->
          <span class="logo-lg"><b>관리자 페이지</b></span>
        </a>

        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top" role="navigation">
        <!-- search form -->

          <!-- Sidebar toggle button-->
          <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>   
          </a>
           <div class="sidebar-form input-group" style="width: 50%; position: relative; top: -5px">
              <input type="text" name="q" id="searchKeyword" placeholder="Search..."  style = "width :100%;"/>
              <span class="input-group-btn">
                <button type='submit' name='search' id='searchButton' class="btn btn-flat"><i class="fa fa-search"></i></button>
              </span>
            </div>
            <ul class="nav navbar-nav" style = "float: right; position: relative; top: -55px">
              <li class="dropdown user user-menu">
                <a href="/main.do" >
                  <span class="hidden-xs">유저 화면 보기</span>  
                </a>
              </li>
              <li class="dropdown user user-menu">
                <a href="logout.do" >
                  <span class="hidden-xs">로그아웃</span>  
                </a>
              </li>
            </ul>
        </nav>
      </header>
      <!-- Left side column. contains the logo and sidebar -->
      <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
          <!-- Sidebar user panel -->
          <div class="user-panel">
            <div class="pull-left info">

            </div>  
          </div>
          <!-- search form -->
          <form action="#" method="get" class="sidebar-form">
          </form>
          <!-- /.search form -->
          <!-- sidebar menu: : style can be found in sidebar.less -->
          <ul class="sidebar-menu">
            <li class="treeview">
              <ul class="treeview-menu">
                <li><a href="/resources/index.html"><i class="fa fa-circle-o"></i> Dashboard v1</a></li>
                <li><a href="/resources/index2.html"><i class="fa fa-circle-o"></i> Dashboard v2</a></li>
              </ul>
            </li>
            <li class="treeview">
              <ul class="treeview-menu">
                <li><a href="../layout/top-nav.html"><i class="fa fa-circle-o"></i> Top Navigation</a></li>
                <li><a href="../layout/boxed.html"><i class="fa fa-circle-o"></i> Boxed</a></li>
                <li><a href="../layout/fixed.html"><i class="fa fa-circle-o"></i> Fixed</a></li>
                <li><a href="../layout/collapsed-sidebar.html"><i class="fa fa-circle-o"></i> Collapsed Sidebar</a></li>
              </ul>
            </li> 
            <li>
           <div id="buttons">
		      <label style="margin: 5px; width: 150px;"> <input id="query"  type="text" placeholder="카테고리 입력" style="width: 150px"/><button id="add-button"  onclick="addCategory()">추가</button></label>
		   </div>
            </li>  
            <li>
              <a href="#" id = "allContent">
                 <span><b>전체</b></span> 
              </a>
            </li>

		<c:forEach items="${categoryList}" var="category">
             <li>
              <a href="#"  class = "category"  id = "${category.id}">
                 <span>${category.category}</span> 
              </a>
            </li>
		</c:forEach>
		
		<li>
		<br/>
		</li>
		
            <li>
            <span style="margin-left: 10px; color: white;"><b>전체 방문자 : ${sessionScope.totalCount}</b></span>
            </li>
             <li>
            <span style="margin-left: 10px;color: white;"><b>오늘 방문자 : ${sessionScope.todayCount}</b></span>
            </li>
            
          </ul>
        </section>
        <!-- /.sidebar -->
      </aside>

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            Kingcar Page
          </h1>
        </section>