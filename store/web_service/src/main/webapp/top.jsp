<%--
  Created by IntelliJ IDEA.
  User: Leebx
  Date: 2019/8/14
  Time: 17:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<!--顶部-->
<div class="nav-top">

    <!--页面顶部白条条，由js动态加载-->

    <!--头部-->
    <div class="header" id="headApp">
        <div class="py-container">
            <div class="yui3-g Logo">
                <div class="yui3-u Left logoArea">
                    <a class="logo-bd" title="乐优" href="index.html" target="_blank"></a>
                </div>
                <div class="yui3-u Center searchArea">
                    <div class="search">
                        <form action="" class="sui-form form-inline">
                            <!--searchAutoComplete-->
                            <div class="input-append">
                                <input type="text" id="autocomplete" type="text" v-model="key"
                                       class="input-error input-xxlarge"/>
                                <button @click="search" class="sui-btn btn-xlarge btn-danger" type="button">搜索</button>
                            </div>
                        </form>
                    </div>
                    <div class="hotwords">
                        <ul>
                            <li class="f-item">乐优首发</li>
                            <li class="f-item">亿元优惠</li>
                            <li class="f-item">9.9元团购</li>
                            <li class="f-item">每满99减30</li>
                            <li class="f-item">亿元优惠</li>
                            <li class="f-item">9.9元团购</li>
                            <li class="f-item">办公用品</li>

                        </ul>
                    </div>
                </div>
                <div class="yui3-u Right shopArea">
                    <div class="fr shopcar">
                        <div class="show-shopcar" id="shopcar">
                            <span class="car"></span>
                            <a class="sui-btn btn-default btn-xlarge" href="${pageContext.request.contextPath}/cart/show?userId=${user.id}" target="_blank">
                                <span>我的购物车</span>
                                <i class="shopnum"></i>
                            </a>
                            <%--<div class="clearfix shopcarlist" id="shopcarlist" style="display:none">--%>
                                <%--<p>"啊哦，你的购物车还没有商品哦！"</p>--%>
                                <%--<p>"啊哦，你的购物车还没有商品哦！"</p>--%>
                            <%--</div>--%>
                        </div>
                    </div>
                </div>
            </div>

            <div class="yui3-g NavList">
                <div class="yui3-u Left all-sort">
                    <h4>乐优精品</h4>
                </div>
                <div class="yui3-u Center navArea">
                    <ul class="nav">
                        <li class="f-item">服装城</li>
                        <li class="f-item">美妆馆</li>
                        <li class="f-item">品优超市</li>
                        <li class="f-item">全球购</li>
                        <li class="f-item">闪购</li>
                        <li class="f-item">团购</li>
                        <li class="f-item">有趣</li>
                        <li class="f-item"><a href="seckill-index.html" target="_blank">秒杀</a></li>
                    </ul>
                </div>
                <div class="yui3-u Right"></div>
            </div>
        </div>
    </div>
    <script src="./js/vue/vue.js"></script>
    <script src="./js/pages/shortcut.js"></script>
    <script type="text/javascript">
        console.log(Vue);
        var headVm = new Vue({
            el: "#headApp",
            data: {
                key: "",
                query: location.search
            },
            methods: {
                search() {
                    window.location = 'search.html?key=' + this.key;
                },
                getUrlParam: function (name) {
                    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
                    var r = window.location.search.substr(1).match(reg);
                    if (r != null) {
                        return decodeURI(r[2]);
                    }
                    return null;
                }
            },
            created() {
                this.key = this.getUrlParam("key");
            },
            components: {
                shortcut
            }
        })
    </script>
</div>

</body>
</html>