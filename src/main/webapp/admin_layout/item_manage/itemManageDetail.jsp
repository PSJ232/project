<%@page import="vo.ItemBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ItemBean ib = (ItemBean)request.getAttribute("itemDetail");
%>
<!DOCTYPE>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="./css/admin.css">
    <link rel="stylesheet" href="./css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
</head>
    <body>
        <!-- header -->
      	<jsp:include page="/inc/adminHeader.jsp" ></jsp:include>
      	<!-- header -->
      	
   	    <!-- nav -->
		<jsp:include page="/inc/navigation.jsp" ></jsp:include>
		<!-- nav -->
        <div id="container">
            <main id="main_layout">
                <form action="">
                    <section class="product_manage_box">
                        <div>
                            <ul class="product_manage_layout">
                                <li>
                                    <label>상품명</label>
                                    <input type="text" class="product_manage_name" value="<%=ib.getI_name()%>" readonly>
                                </li>
                                <li>
                                    <label>상품코드</label>
                                    <input type="text" class="product_manage_code" value="<%=ib.getI_id()%>" readonly>
                                </li>
                                <li>
                                    <label>제품등록일</label>
                                    <input type="text" class="product_manage_name" value="<%=ib.getI_rdate()%>" readonly>
                                </li>
                                <li>
                                    <label>가격</label>
                                    <input type="text" class="product_manage_name" value="<%=ib.getI_price()%>" readonly>
                                </li>
                                <li>
                                    <label>할인율(%)</label>
                                    <input type="text" class="product_manage_discount" value="<%=ib.getI_discount()%>" readonly>
                                </li>
                                <li>
                                    <label>요약설명</label>
                                    <input type="text" class="product_manage_info" value="<%=ib.getI_desc()%>" readonly>
                                </li>
                                <li>
                                    <label>size(S/M/L)</label>
                                    <select class="product_manage_size" disabled>
                                        <option value="null">선택</option>
                                        <option value="S">Small</option>
                                        <option value="M">Medium</option>
                                        <option value="L">Large</option>
                                    </select>
                                </li>
                                <li>
                                    <label>현재수량</label>
                                    <input type="text" class="product_manage_inven" value="<%=ib.getI_inven()%>" readonly>
                                </li>
                                <li>
                                    <label>진열상태</label>
                                    <select class="product_manage_dpstatus" disabled>
                                        <option value="null">선택</option>
                                        <option value="prepare">준비중</option>
                                        <option value="on sale">판매중</option>
                                        <option value="sold out">매진</option>
                                    </select>
                                </li>
                                <li>
                                    <label>제품상태</label> <!--신상품, 재입고-->
                                <select class="product_manage_productstatus"  disabled>
                                    <option value="null">선택</option>
                                    <option value="prepare">준비중</option>
                                    <option value="on sale">판매중</option>
                                    <option value="sold out">매진</option>
                                </select>
                            </li>
                        </ul> 
                    </div>
                </section>
            
                <section class="product_manage_box">
                    <div>
                        <ul class="product_manage_layout">
                            <li>
                                <label>메인이미지</label>
                                <input type="file" class="product_manage_mainimg" value="<%=ib.getI_img()%>" disabled>
                            </li>
                            <li>
                                <label>서브이미지1</label>
                                <input type="file" class="product_manage_subimg1" value="<%=ib.getI_subimg2()%>" disabled>
                            </li>
                            <li>
                                <label>서브이미지2</label>
                                <input type="file" class="product_manage_subimg2" value="<%=ib.getI_subimg3()%>" disabled>
                            </li>
                            <li>
                                <label>서브이미지3</label>
                                <input type="file" class="product_manage_subimg3" value="<%=ib.getI_subimg4()%>" disabled>
                            </li>
                            <li>
                                <label>상세설명</label>
                                <input type="file" class="product_manage_detailpage" value="<%=ib.getI_detailpage()%>" disabled>
                            </li>
                        </ul>
                    </div>
                </section>
                <div class="product_manage_btnbox">
                    <input type="button" value="수정" onclick="location.href='ItemUpdatePage.ad?i_id=<%=ib.getI_id()%>'" class="btn_m btn_yellow">
                    <input type="button" value="삭제" onclick="location.href='ItemDelete.ad?i_id=<%=ib.getI_id()%>'" class="btn_m btn_gray">
                </div>
            </form>
        </main>

    </div>
</body>
</html>