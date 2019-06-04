<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Main</title>
<meta name="description" content="Ela Admin - HTML5 Admin Template">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png">
<link rel="shortcut icon" href="https://i.imgur.com/QRAUqs9.png">
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">

<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
<link rel="stylesheet" href="assets/css/cs-skin-elastic.css">
<link rel="stylesheet" href="assets/css/style.css">
<!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->
<link
   href="https://cdn.jsdelivr.net/npm/chartist@0.11.0/dist/chartist.min.css"
   rel="stylesheet">
<link
   href="https://cdn.jsdelivr.net/npm/jqvmap@1.5.1/dist/jqvmap.min.css"
   rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>



<style>
#cardHeader {
   text-align: center;
}

#todaysMenu {
   background-color: white;
   padding-left: 20px;
   padding-right: 20px;
   border-radius: 10px;
}

#caroWrapper {
   display: flex;
   justify-content: center;
   padding-top: 30px;
}

#remember {
   width: 35%;
   height: 100%;
   margin: 0px;
}

.modal-footer {
   box-sizing: border-box;
}

.modal-body1 {
   padding: 1px;
}

.card-header {
   color: gray;
   background-color: #bbe3e3;
}

.card-text {
   text-align: left;
}
.myspan {
   text-align: center;
}
</style>
</head>

<body>
   <!-- 왼쪽 네비 시작 -->
   <aside id="left-panel" class="left-panel">
      <nav class="navbar navbar-expand-sm navbar-default">
         <div id="main-menu" class="main-menu collapse navbar-collapse">
            <ul class="nav navbar-nav">
               <li class="active"><a href="page?url=WEB-INF/main.jsp"><i
                     class="menu-icon fa fa-laptop"></i>Home </a></li>
               <li class="menu-item-has-children dropdown"><a
                  href="page?url=WEB-INF/seat.jsp" onclick="send()"> <i
                     class="menu-icon fa fa-cogs"></i>잔여좌석
               </a></li>
                <li class="menu-item-has-children dropdown"><a
                  href="ClientSelect.admin"> <i
                     class="menu-icon fa fa-table"></i>메뉴
               </a></li>
               <li class="menu-item-has-children dropdown"><a
                  href="Board.board?currentPage=1"> <i
                     class="menu-icon fa fa-th"></i>고객의소리
               </a></li>
               <c:choose>
                  <c:when test="${user == null }">
                     <li id="charge" class="menu-item-has-children dropdown"><a
                        href="#"> <i class="menu-icon fa fa-tasks"></i>충전하기
                     </a></li>
                     <script>
                        $("#charge").on("click", function() {
                           alert("로그인 후 이용가능합니다.");
                        })
                     </script>
                  </c:when>
                  <c:otherwise>
                     <li id="charge" class="menu-item-has-children dropdown"><a
                        href="page?url=WEB-INF/pay.jsp"> <i
                           class="menu-icon fa fa-tasks"></i>충전하기
                     </a></li>
                  </c:otherwise>
               </c:choose>
            </ul>
         </div>
      </nav>
   </aside>
   <!-- 왼쪽 네비 끝 -->
   <!-- 상단 검색바 마이페이지 등등 시작 -->
   <div id="right-panel" class="right-panel">
      <!-- Header-->
      <header id="header" class="header">
         <div class="top-left">
            <div class="navbar-header">
               <a class="navbar-brand" href="./"><img src="images/logo.png"
                  alt="Logo"></a> <a class="navbar-brand hidden"
                  href="page?url=WEB-INF/main.jsp"><img src="images/logo2.png"
                  alt="Logo"></a> <a id="menuToggle" class="menutoggle"><i
                  class="fa fa-bars"></i></a>
            </div>
         </div>
         <c:choose>
            <c:when test="${user != null }">
               <div class="top-right">
                  <div class="header-menu">
                     <div class="header-left">
                        <button class="search-trigger">
                           <i class="fa fa-search"></i>
                        </button>
                        <div class="form-inline">
                           <form class="search-form">
                              <input class="form-control mr-sm-2" type="text"
                                 placeholder="Search ..." aria-label="Search">
                              <button class="search-close" type="submit">
                                 <i class="fa fa-close"></i>
                              </button>
                           </form>
                        </div>

                        <div class="dropdown for-notification">
                           <button class="btn btn-secondary dropdown-toggle" type="button"
                              id="notification" data-toggle="dropdown" aria-haspopup="true"
                              aria-expanded="false">
                              <i class="fa fa-bell"></i> <span class="count bg-danger">3</span>
                           </button>
                           <div class="dropdown-menu" aria-labelledby="notification">
                              <p class="red">You have 3 Notification</p>
                              <a class="dropdown-item media" href="#"> <i
                                 class="fa fa-check"></i>
                                 <p>Server #1 overloaded.</p>
                              </a> <a class="dropdown-item media" href="#"> <i
                                 class="fa fa-info"></i>
                                 <p>Server #2 overloaded.</p>
                              </a> <a class="dropdown-item media" href="#"> <i
                                 class="fa fa-warning"></i>
                                 <p>Server #3 overloaded.</p>
                              </a>
                           </div>
                        </div>

                        <div class="dropdown for-message">
                           <button class="btn btn-secondary dropdown-toggle" type="button"
                              id="message" data-toggle="dropdown" aria-haspopup="true"
                              aria-expanded="false">
                              <i class="fa fa-envelope"></i> <span class="count bg-primary">4</span>
                           </button>
                           <div class="dropdown-menu" aria-labelledby="message">
                              <p class="red">You have 4 Mails</p>
                              <a class="dropdown-item media" href="#"> <span
                                 class="photo media-left"><img alt="avatar"
                                    src="images/avatar/1.jpg"></span>
                                 <div class="message media-body">
                                    <span class="name float-left">Jonathan Smith</span> <span
                                       class="time float-right">Just now</span>
                                    <p>Hello, this is an example msg</p>
                                 </div>
                              </a> <a class="dropdown-item media" href="#"> <span
                                 class="photo media-left"><img alt="avatar"
                                    src="images/avatar/2.jpg"></span>
                                 <div class="message media-body">
                                    <span class="name float-left">Jack Sanders</span> <span
                                       class="time float-right">5 minutes ago</span>
                                    <p>Lorem ipsum dolor sit amet, consectetur</p>
                                 </div>
                              </a> <a class="dropdown-item media" href="#"> <span
                                 class="photo media-left"><img alt="avatar"
                                    src="images/avatar/3.jpg"></span>
                                 <div class="message media-body">
                                    <span class="name float-left">Cheryl Wheeler</span> <span
                                       class="time float-right">10 minutes ago</span>
                                    <p>Hello, this is an example msg</p>
                                 </div>
                              </a> <a class="dropdown-item media" href="#"> <span
                                 class="photo media-left"><img alt="avatar"
                                    src="images/avatar/4.jpg"></span>
                                 <div class="message media-body">
                                    <span class="name float-left">Rachel Santos</span> <span
                                       class="time float-right">15 minutes ago</span>
                                    <p>Lorem ipsum dolor sit amet, consectetur</p>
                                 </div>
                              </a>
                           </div>
                        </div>
                        	<c:if test="${user.id ne 'admin'}">
								<button type="button" class="btn btn-primary" id="msg">msg</button>
								</c:if>
                     </div>
                     <!--  mypage 사람 사진-->
                     <div class="user-area  float-right">
                        <a href="#" class="active" data-toggle="modal"
                           aria-haspopup="true" aria-expanded="false"
                           data-target="#exampleModal1"> <img
                           class="user-avatar rounded-circle" src="images/admin.jpg"
                           alt="profile"></a>
                     </div>
                  </div>
               </div>
            </c:when>
            <c:otherwise>
               <div class="top-right">
                  <div class="header-menu">
                     <div class="header-left">
                        <button class="search-trigger">
                           <i class="fa fa-search"></i>
                        </button>
                        <div class="form-inline">
                           <form class="search-form">
                              <input class="form-control mr-sm-2" type="text"
                                 placeholder="Search ..." aria-label="Search">
                              <button class="search-close" type="submit">
                                 <i class="fa fa-close"></i>
                              </button>
                           </form>
                        </div>
                        <div class="dropdown for-notification">
                           <button type="button"
                              class="btn btn-outline-danger signbt mb-2" data-toggle="modal"
                              data-target="#exampleModal" id="loginbtn">login</button>
                        </div>
                     </div>
                  </div>
               </div>
            </c:otherwise>
         </c:choose>
      </header>
      <!--       상단 네비 끝 -->
      <!-- 오늘의 메뉴 시작-->
      <div id="caroWrapper">
         <div id="caroInner" class="col-lg-6 col-md-8 col-sm-12">
            <div class="card">
               <div class="card-header" id="cardHeader">
                  <strong class="card-title mb-3"><h1>
                        <span id="todaysMenu">${top }</span>
                     </h1></strong>

               </div>
               <div class="card-body">
                  <div class="mx-auto d-block">
                     <div id="myCarousel" class="carousel slide " data-ride="carousel"
                        data-interval="4000">
                        <ol class="carousel-indicators">
                           <li data-target="#carouselExampleIndicators" data-slide-to="0"
                              class="active"></li>
                           <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                           <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                        </ol>
                        <div class="carousel-inner">
                           <div class="carousel-item active">
                              <img src="${food1 }" class="d-block w-200 myImg"
                                 alt="이미지를 찾을 수 없습니다.">
                              <div class="carousel-caption d-none d-md-block">
                                 <h5>${food1Desc }</h5>
                              </div>
                           </div>
                           <div class="carousel-item">
                              <img src="${food2 }" class="d-block w-200 myImg"
                                 alt="이미지를 찾을 수 없습니다.">
                              <div class="carousel-caption d-none d-md-block">
                                 <h5>${food2Desc }</h5>
                              </div>
                           </div>
                           <div class="carousel-item">
                              <img src="${food3 }" class="d-block w-200 myImg"
                                 alt="이미지를 찾을 수 없습니다.">
                              <div class="carousel-caption d-none d-md-block">
                                 <h5>${food3Desc }</h5>
                              </div>
                           </div>
                        </div>
                        <a class="carousel-control-prev" href="#myCarousel"
                           role="button" data-slide="prev"> <span
                           class="carousel-control-prev-icon" aria-hidden="true"></span> <span
                           class="sr-only">Previous</span>
                        </a> <a class="carousel-control-next" href="#myCarousel"
                           role="button" data-slide="next"> <span
                           class="carousel-control-next-icon" aria-hidden="true"></span> <span
                           class="sr-only">Next</span>
                        </a>
                     </div>
                  </div>

                  <h5 class="text-sm-center mt-2 mb-1">${bot1 }</h5>
                  <div class="location text-sm-center">${bot2 }</div>
               </div>
               <hr>
            </div>
         </div>
      </div>

      <!-- Content 시작 -->
      <div class="content">
         <div class="animated fadeIn">
            <div class="row">
               <c:forEach var="dto" items="${list}">
                  <div class="col-md-4 col-sm-6">
                     <div class="card">
                        <div class="card-header headerWrapper">
                           <div class="cardTitle">
                              <strong class="card-title mb-3">${dto.menuName}</strong>
                           </div>
                        </div>
                        <div class="card-body">
                           <div class="mx-auto d-block myspan">
                              <div>
                                 <img src="${dto.imgPath}" alt="">
                              </div>
                              <h5 class="text-sm-center mt-2 mb-1">${dto.menuDesc}</h5>
                              <span>${dto.menuPrice}</span>원 <input type="hidden"
                                 value="${dto.menu_seq}">
                           </div>
                           <button class = "btn" id="menu${dto.menu_seq }">결제하기 </button> 
                           <hr>
                        </div>
                     </div>
                  </div>
                  <script>
                  $("#menu${dto.menu_seq }").on("click",function(){
                		IMP.init('imp96545220'); 
                		IMP.request_pay({
                		    pg : 'inicis', // version 1.1.0부터 지원.
                		    pay_method : 'card',
                		    merchant_uid : 'merchant_' + new Date().getTime(),
                		    name : '${dto.menuName}',
                		    amount : '${dto.menuPrice}',
                		    buyer_email : 'iamport@siot.do',
                		    buyer_name : '구매자이름',
                		    buyer_tel : '010-1234-5678',
                		    buyer_addr : '서울특별시 강남구 삼성동',
                		    buyer_postcode : '123-456',
                		    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
                		}, function(rsp) {
                		    if ( rsp.success ) {
                		        var msg = '결제가 완료되었습니다.';
                		        paid_amount = rsp.paid_amount;
                		        name = rsp.name;
                		        location.href = "time.pay?id="+id+"&amount="+paid_amount+"&name="+name;
                		    } else {
                		        var msg = '결제에 실패하였습니다.';
                		        msg += '에러내용 : ' + rsp.error_msg;
                		    }
                		    alert(msg);
                		   
                		});
                		})
                  
                  
                  
                  
                  
                  </script>
              </c:forEach>
            </div>
         </div>
         <!-- .row -->
      </div>
      <!--                여기부터 진향이가 만든 로그인폼 -->
      <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
         aria-labelledby="exampleModalLabel" aria-hidden="true">
         <div class="modal-dialog" role="document">
            <div class="modal-content">
               <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">L O G I N</h5>
                  <button type="button" class="close" data-dismiss="modal"
                     aria-label="Close">
                     <span aria-hidden="true">&times;</span>
                  </button>
               </div>
               <div class="modal-body">
                  <form action="loginProc.member" id="form" method="post">
                     <div class="form-group">
                        <label for="exampleFormControlInput1">ID</label> <input
                           type="text" class="form-control" id="joinemail"
                           placeholder="ID를 입력하시오" required name="loginid">
                     </div>
                     <div class="form-group">
                        <label for="exampleFormControlInput1">Password</label> <input
                           type="password" class="form-control" id="joinpassword"
                           placeholder="비밀번호 입력하시오" required name="loginpw">
                     </div>
                     <div class="modal-footer">
                     <button type="button" class="btn btn-primary" type="button"
										id="findId">아이디 찾기</button>
                        <button type="button" class="btn btn-primary" type="button"
                           id="reinputpw">비밀번호 찾기</button>
                        <button type="button" class="btn btn-primary" type="button"
                           id="joinMem">회원가입</button>
                        <button type="button" class="btn btn-primary" id="login">login</button>
                        
                     </div>
                  </form>
               </div>
            </div>
         </div>
      </div>
      <script>
      $("#findId").on("click",function(){

  		location.href = "page?url=WEB-INF/modifyid.jsp";
  		})
  		
         $("#reinputpw").on("click", function() {
            location.href = "page?url=WEB-INF/modifypassword.jsp";
         })
         $("#joinMem").on("click", function() {
            location.href = "page?url=WEB-INF/joinMem.jsp";
         })
         document.getElementById("login").onclick = function() {
            document.getElementById("form").submit();
         }
         //                            로그인 버튼과 회원가입 버튼의 script
      </script>

      <!--                   진향이 로그인폼끝 -->
      <!--                         진향이 마이페이지 폼 -->
      <div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog"
         aria-labelledby="exampleModalLabel1" aria-hidden="true">
         <div class="modal-dialog" role="document">
            <div class="modal-content">
               <div class="modal-body1">
                  <form>
                     <div class="form-group m-0 p-0">
                        <div class="card">
                           <div class="card-header">
                              <i class="fa fa-user"></i><strong class="card-title pl-2">
                                 My Page </strong>
                              <button type="button" class="close" data-dismiss="modal"
                                 aria-label="Close">
                                 <span aria-hidden="true">&times;</span>
                              </button>
                           </div>
                           <div class="card-body">
                              <div class="mx-auto d-block">
                                 <img class="rounded-circle mx-auto d-block"
                                    src="images/admin.jpg" alt="profile image" width="130px">
                                 <h5 class="text-center mt-2 mb-1">
                                    <b>${user.id} 님</b>
                                 </h5>
                                 <!-- <div class="location text-center">Lv. 일반회원</div> -->
                              </div>
                              <hr>
                              <div class="card-text">
                                 <div>
                                    <b>이름 </b>
                                    <p>${user.name}</p>
                                 </div>
                                 <div>
                                    <b>생년월일</b>
                                    <p>${user.birth}</p>
                                 </div>
                                 <div>
                                    <b>이메일</b>
                                    <p>${user.email}</p>
                                 </div>
                                 <div>
                                    <b>핸드폰번호</b>
                                    <p>${user.phone}</p>
                                 </div>
                                 <div>
                                    <b>잔여포인트</b>
                                    <p>${user.point}</p>
                                 </div>
                                 <div>
                                    <b>주소</b>
                                    <p>${user.address1 }</p>
                                    <p>${user.address2 }</p>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="modal-footer">
                        <button id="deleteMembtn" type="button"
                           class="btn btn-outline-info" data-dismiss="modal">회원
                           탈퇴</button>
                        <button id="pointPagebtn" type="button"
                           class="btn btn-outline-info" data-dismiss="modal">포인트
                           충전</button>
                        <button id="updatememberbtn" type="button"
                           class="btn btn-outline-info" data-dismiss="modal">정보수정</button>
                        <button type="button" class="btn btn-primary" id="logoutbtn1">로그아웃</button>

                     </div>
                  </form>

               </div>
            </div>
         </div>
      </div>



      <script>
      
      
         $("#logoutbtn1").on("click", function() {
            location.href = "logoutProc.member";
         })

         $("#updatememberbtn").on("click", function() {
            location.href = "page?url=WEB-INF/ModifyMembers.jsp";
         })
         $("#deleteMembtn").on("click", function() {
            location.href = "page?url=WEB-INF/deleteMem.jsp";
         })
         $("#pointPagebtn").on("click", function() {
            location.href = "page?url=WEB-INF/pay.jsp";
         })
      </script>
      <!-- 진향이 마이페이지 폼끝 -->

      <!-- 컨텐츠 끝 -->

      <div class="clearfix"></div>
      <!-- Footer -->
      <footer class="site-footer">
         <div class="footer-inner bg-white">
            <div class="row">
               <div class="col-sm-6">Copyright &copy; 2019년 PC방임</div>
               <div class="col-sm-6 text-right">
                  Designed by <a href="https://colorlib.com">1조</a>
               </div>
            </div>
         </div>
      </footer>

      <script
         src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
      <script
         src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
      <script
         src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
      <script
         src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
      <script src="assets/js/main.js"></script>
      <script>
         $("#updatememberbtn").on("click", function() {
            location.href = "page?url=WEB-INF/ModifyMembers.jsp";
         })
         $("#deleteMembtn").on("click", function() {
            location.href = "page?url=WEB-INF/deleteMem.jsp";
         })
         $("#pointPagebtn").on("click", function() {
            location.href = "page?url=WEB-INF/pay.jsp";
         })
      </script>
      
      
       <!--메시지  -->
     	<script>
										//msg보내는 소켓 및 버튼
										 var webSocket = new WebSocket('ws://192.168.60.29:8080/AmandaProject1/broadcasting);
									    webSocket.onerror = function(event) {
     									 onError(event)
   											 };
  										 webSocket.onmessage = function(event) {
   										   onMessage(event)
  										  };
  									 
  									 
  										if("${user.id}"!="admin"){
  										  function onMessage(event) {
    										  var msg = event.data.split(":");
       										  var who = msg[0]; //admin
       											var contents = msg[1];
       											 var who2=msg[2]; //clinet이름      											    							
     								 if("${user.name}"==who2&&who=="admin") 
     								{
    								window.open("replytoclient.message?who="+who2+"&&content="+contents, "",
									"width=500px,height=300px");
     										 
     								 }
     								 
     							 }
     							
  								}
  										
  										$("#msg")
  										.on(
  												"click",
  												function() {
  													
  													window.open("page?url=WEB-INF/newmessage.jsp", "","width=500px,height=300px");
  												
  												})
  								</script>
     
     
     
     
</body>
</html>