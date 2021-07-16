<%@page import="vo.ItemBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<ItemBean> itemList = (ArrayList)request.getAttribute("itemList");
%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
    <link rel="stylesheet" href="admin_layout/css/style.css">
  </head>
  <body>
  	<jsp:include page="../inc/adminHeader.jsp" ></jsp:include>
    <div>
      <div class="category_content">
        <div class="category_header category_img">
          <div class="category_table">
            <h3 class="category_title">꾸까 꽃다발</h3>
            <p class="category_detail">계절을 가득 담은 꽃다발로</p>
            <p class="category_detail"> 당신의 일상을 특별한 날로 만들어보세요</p>
          </div>
        </div>
      </div>

      <div id="container">
        <div class="product_array_box">
          <select class="product_array" name="product_array">
              <option value="product_order_rank" class="product_order_list">추천순</option>
              <option value="product_order_highSelling" class="product_order_list">인기순</option>
              <option value="product_order_new" class="product_order_list">신상품순</option>
          </select>
        </div>
        <main class="fontsize_zero">
          <ul>
          <%
          for(ItemBean ib : itemList) {
          %>
            <li id="product_list">
              <div class="product_layout">
                <div class="product_box">
                  <a href="product_detail.html"><img src="./admin_layout/upload/<%=ib.getI_img()%>" alt="flowerimage" class="product_img"></a>
                  <div class="product_info">
                    <a href="product_detail.html" class="product_info_textbox product_info_name">
                    	<%=ib.getI_name() %>
                    </a>
                    <span class="product_info_textbox product_info_box">
                      <span class="product_info_price"><%=ib.getI_price()%>원</span>
                      <span class="product_info_discountprice"><%=(int)(ib.getI_price()*(1-ib.getI_discount()))%>원 (<%=(int)(ib.getI_discount()*100)%>%)</span>
                    </span>
                    <span class="product_info_textbox product_info_box">
                      <span class="product_inven"><%=ib.getI_inven()%>개</span>
	                    <%
	                    if(ib.getI_inven()==0){
	                    %>
	                      <span class="product_restock">&#10071; 재입고 필요</span>
	                    <%
	                    }
	                    %>
                    </span>
                  </div>
                </div>
              </div>
            </li>
		  <%
          }
		  %>
          </ul>
        </main>
        <div class="admin_navigation">

        </div>
        <div class="product_list">

        </div>

      </div>
    </div>
    <footer>
      <!-- <div>Icons made by <a href="" title="Icongeek26">Icongeek26</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></div>
      <div>Icons made by <a href="https://www.flaticon.com/authors/srip" title="srip">srip</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></div>
      <div>Icons made by <a href="https://www.flaticon.com/authors/icongeek26" title="Icongeek26">Icongeek26</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></div> -->

      <div id="container">
        <div class="">

        </div>
      </div>


    </footer>
  <script type="text/javascript" src="script.js"></script>
  </body>
</html>
