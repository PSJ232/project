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
    <link rel="stylesheet" href="admin_layout/css/admin.css">
    <link rel="stylesheet" href="admin_layout/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
</head>
    <body>
        <!-- header -->
      	<jsp:include page="../inc/adminHeader.jsp" ></jsp:include>
      	<!-- header -->
      	
   	    <!-- nav -->
		<jsp:include page="../inc/navigation.jsp" ></jsp:include>
		<!-- nav -->
        <div id="container">
            <main id="main_layout">
                <form action="ItemUpdate.ad" method="post" enctype="multipart/form-data">
                    <section class="product_manage_box">
                        <div>
                            <ul class="product_manage_layout">
                                <li>
                                    <label>상품명</label>
                                    <input type="text" class="product_manage_name" name="i_name" value="<%=ib.getI_name()%>" required>
                                </li>
                                <li>
                                    <label>상품코드</label>
                                    <input type="text" class="product_manage_code" name="i_id" value="<%=ib.getI_id()%>" disabled>
                                </li>
                                <li>
                                    <label>제품등록일</label>
                                    <input type="text" class="product_manage_name" name="i_rdate" value="<%=ib.getI_rdate()%>" disabled>
                                </li>
                                <li>
                                    <label>가격</label>
                                    <input type="text" class="product_manage_name" name="i_price" value="<%=ib.getI_price()%>" required>
                                </li>
                                <li>
                                    <label>할인율(%)</label>
                                    <input type="text" class="product_manage_discount" name="i_discount" value="<%=ib.getI_discount()%>" required>
                                </li>
                                <li>
                                    <label>요약설명</label>
                                    <input type="text" class="product_manage_info" name="i_desc" value="<%=ib.getI_desc()%>" required>
                                </li>
                                <li>
                                    <label>size(S/M/L)</label>
                                    <select class="product_manage_size" name="i_size" required>
                                        <option value="null">선택</option>
                                        <option value="S">Small</option>
                                        <option value="M">Medium</option>
                                        <option value="L">Large</option>
                                    </select>
                                </li>
                                <li>
                                    <label>현재수량</label>
                                    <input type="text" class="product_manage_inven" name="i_inven" value="<%=ib.getI_inven()%>" required>
                                </li>
                                <li>
                                    <label>진열상태</label>
                                    <select class="product_manage_dpstatus" name="i_dpstatus" required>
                                        <option value="null">선택</option>
                                        <option value="prepare">준비중</option>
                                        <option value="on sale">판매중</option>
                                        <option value="sold out">매진</option>
                                    </select>
                                </li>
                                <li>
                                    <label>제품상태</label> <!--신상품, 재입고-->
                                <select class="product_manage_productstatus" name="i_itemstatus" required>
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
                                <input type="file" class="product_manage_mainimg" name="i_img" value="<%=ib.getI_img()%>" required>
                            </li>
                            <li>
                                <label>서브이미지1</label>
                                <input type="file" class="product_manage_subimg1" name="i_subimg2" value="<%=ib.getI_subimg2()%>">
                            </li>
                            <li>
                                <label>서브이미지2</label>
                                <input type="file" class="product_manage_subimg2" name="i_subimg3" value="<%=ib.getI_subimg3()%>">
                            </li>
                            <li>
                                <label>서브이미지3</label>
                                <input type="file" class="product_manage_subimg3" name="i_subimg4" value="<%=ib.getI_subimg4()%>">
                            </li>
                            <li>
                                <label>상세설명</label>
                                <input type="file" class="product_manage_detailpage" name="i_detailpage" value="<%=ib.getI_detailpage()%>" required>
                            </li>
                        </ul>
                    </div>
                </section>
                <div class="product_manage_btnbox">
                    <input type="submit" value="수정" class="btn_m btn_yellow">
                </div>
            </form>
        </main>

    </div>
</body>
</html>