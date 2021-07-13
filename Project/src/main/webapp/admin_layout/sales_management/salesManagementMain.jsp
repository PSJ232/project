<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
        <link rel="stylesheet" href="../css/style.css">
    </head>
    <body>
        <div id="wrap">
            <main id="main_layout">
                <section class="sales_layout1">
                    <table>
                        <form action="">
                            <tr class="sales_layout_detail">
                                <td class="sales_period_title">분석방법</td>
                                <td>
                                    <input type="radio" class="sales_period"> 결제수단별
                                    <input type="radio" class="sales_period"> 년별
                                    <input type="radio" class="sales_period"> 월별
                                    <input type="radio" class="sales_period"> 일별
                                    <input type="radio" class="sales_period"> 요일별
                                </td>
                            </tr>
                            <tr class="sales_layout_detail">
                                <td class="sales_period_title">기간</td>
                                <td>
                                    <input type="date">~<input type="date">
                                    <input type="submit" value="검색" clss="btn_m btn_yellow">
                                </td>
                            </tr>
                        </form>
                    </table>
                </section>
                <section class="sales_layout2">
                    <p>차트가 들어가는 곳입니다</p>

                </section>
            </main>
        </div>
    </body>
</html>