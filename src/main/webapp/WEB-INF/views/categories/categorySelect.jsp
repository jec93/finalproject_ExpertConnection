<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Expert Connection</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
    .menu-container {
        width: 70%;
        max-width: 1200px;
        margin: 50px auto;
        background-color: white;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        border-radius: 10px;
        padding: 20px;
    }
    .category-box {
        display: flex;
        flex-wrap: wrap;
        gap: 10px;
    }
    .category-item {
        background-color: #2f6b52;
        color: white;
        padding: 10px 20px;
        border-radius: 5px;
        text-align: center;
        cursor: pointer;
        transition: background 0.3s;
        flex: 0 1 calc(20% - 10px);
    }
    .category-item.selected {
        background-color: #333;
        color: white;
    }
    .sub-header {
        font-size: 16px;
        font-weight: bold;
        color: rgb(2, 26, 0);
        text-align: center;
        border-radius: 5px;
        margin-top: 15px;
        margin-bottom: 15px;
        padding: 10px 20px;
    }
    .divider {
        border-bottom: 2px solid #ddd;
        margin: 10px 0;
    }
</style>
</head>
<body>
    <div class="wrap">
        <jsp:include page="/WEB-INF/views/common/header.jsp" />
        <div class="menu-container">
            <h1>전문가 추천</h1>
            <!-- 대분류 출력 -->
            <div id="firstCategories">
                <div id="firstList" class="category-box"></div>
            </div>
            <div class="divider"></div>
            <!-- 중분류 및 소분류 출력 -->
            <div id="subCategories">
                <div id="subList" class="sub-header"></div> <!-- 중분류와 소분류를 출력할 div -->
            </div>
        </div>
        <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    </div>
    <script>
        $(document).ready(function () {
            loadFirstCategories();
        });

        function loadFirstCategories() {
            $.ajax({
                url: "/categories/firstCategory.exco",
                type: "GET",
                dataType: "json",
                success: function (data) {
                    const dataArray = Object.values(data);
                    console.log("Converted Array:", dataArray);
                    dataArray.forEach(function (item) {
                        $('#firstList').append(
                            '<div class="category-item" onclick="loadSubCategories(this, \'' + item.FIRSTCODE + '\')">' + item.FIRSTNAME + '</div>'
                        );
                    });
                },
                error: function (xhr, status, error) {
                    console.error("AJAX Error:", error);
                    alert("대분류 데이터를 가져오지 못했습니다.");
                }
            });
        }

        function loadSubCategories(element, firstCode) {
            $('#subList').empty();
            $('#subCategories').show();

            $('.category-item.selected').removeClass('selected');
            $(element).addClass('selected');

            $.ajax({
                url: "/categories/sub/" + firstCode + ".exco",
                type: "GET",
                dataType: "json",
                success: function (data) {
                    const dataArray = Object.values(data);
                    const groupedData = groupSubCategories(dataArray);

                    displayGroupedCategories(groupedData);
                },
                error: function (xhr, status, error) {
                    console.error("AJAX Error for Subcategories:", error);
                    alert("중분류 및 소분류 데이터를 가져오지 못했습니다.");
                }
            });
        }

        function groupSubCategories(dataArray) {
            const groupedData = {};
            dataArray.forEach(function (item) {
                if (!groupedData[item.SECONDNAME]) {
                    groupedData[item.SECONDNAME] = [];
                }
                groupedData[item.SECONDNAME].push(item.THIRDNAME);
            });
            console.log("Grouped Data:", groupedData);
            return groupedData;
        }

        function displayGroupedCategories(groupedData) {
            $('#subList').empty();
            for (const secondName in groupedData) {
                if (groupedData.hasOwnProperty(secondName)) {
                    $('#subList').append('<div class="sub-header">' + secondName + '</div>');

                    let subHtml = '<div class="category-box">';
                    groupedData[secondName].forEach(function (thirdName) {
                        subHtml += '<div class="category-item thirdCate" data-url="/categories/categoriesResult.exco?cateKey=' + thirdName + '">' + thirdName + '</div>';
                    });
                    subHtml += '</div>';

                    $('#subList').append(subHtml);
                }
            }

            $('.thirdCate').on('click', function () {
                const url = $(this).data('url');
                window.location.href = url;
            });
        }
    </script>
</body>
</html>
