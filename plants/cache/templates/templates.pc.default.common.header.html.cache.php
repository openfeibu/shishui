<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>湿地生物素材库</title>
    <link rel="stylesheet" href="<?php echo HOME_THEME_PATH; ?>css/style.css">
    <script src="<?php echo HOME_THEME_PATH; ?>js/jquery-1.8.3.min.js"></script>
</head>
<body>
        <div class="head"></div>
        <div class="main">
            <div class="select" id="select">
                    <script >
                        $(document).ready(function() {
                            $("#select1 li").click(function() {
                                $(this).addClass("selected").siblings().removeClass("selected");
                                if ($(this).hasClass("select-all")) {
                                    $("#selectA").remove();
                                } else {
                                    var copyThisA = $(this).clone();
                                    if ($("#selectA").length > 0) {
                                        $("#selectA a").html($(this).text());
                                    } else {
                                        $("#select-result").append(copyThisA.attr("id", "selectA"));
                                    }
                                }
                            });
                            $("#select2 li").click(function() {
                                $(this).addClass("selected").siblings().removeClass("selected");
                                if ($(this).hasClass("select-all")) {
                                    $("#selectB").remove();
                                } else {
                                    var copyThisB = $(this).clone();
                                    if ($("#selectB").length > 0) {
                                        $("#selectB a").html($(this).text());
                                    } else {
                                        $("#select-result").append(copyThisB.attr("id", "selectB"));
                                    }
                                }
                            });
                            $("#select3 li").click(function() {
                                $(this).addClass("selected").siblings().removeClass("selected");
                                if ($(this).hasClass("select-all")) {
                                    $("#selectC").remove();
                                } else {
                                    var copyThisC = $(this).clone();
                                    if ($("#selectC").length > 0) {
                                        $("#selectC a").html($(this).text());
                                    } else {
                                        $("#select-result").append(copyThisC.attr("id", "selectC"));
                                    }
                                }
                            });
                            $("#select4 li").click(function() {
                                $(this).addClass("selected").siblings().removeClass("selected");
                                if ($(this).hasClass("select-all")) {
                                    $("#selectD").remove();
                                } else {
                                    var copyThisD = $(this).clone();
                                    if ($("#selectD").length > 0) {
                                        $("#selectD a").html($(this).text());
                                    } else {
                                        $("#select-result").append(copyThisD.attr("id", "selectD"));
                                    }
                                }
                            });
                            $("#select5 li").click(function() {
                                $(this).addClass("selected").siblings().removeClass("selected");
                                if ($(this).hasClass("select-all")) {
                                    $("#selectE").remove();
                                } else {
                                    var copyThisE = $(this).clone();
                                    if ($("#selectE").length > 0) {
                                        $("#selectE a").html($(this).text());
                                    } else {
                                        $("#select-result").append(copyThisE.attr("id", "selectE"));
                                    }
                                }
                            });
                            $("#select6 li").click(function() {
                                $(this).addClass("selected").siblings().removeClass("selected");
                                if ($(this).hasClass("select-all")) {
                                    $("#selectF").remove();
                                } else {
                                    var copyThisF = $(this).clone();
                                    if ($("#selectF").length > 0) {
                                        $("#selectF a").html($(this).text());
                                    } else {
                                        $("#select-result").append(copyThisF.attr("id", "selectF"));
                                    }
                                }
                            });
                            $("#select7 li").click(function() {
                                $(this).addClass("selected").siblings().removeClass("selected");
                                if ($(this).hasClass("select-all")) {
                                    $("#selectG").remove();
                                } else {
                                    var copyThisG = $(this).clone();
                                    if ($("#selectG").length > 0) {
                                        $("#selectG a").html($(this).text());
                                    } else {
                                        $("#select-result").append(copyThisG.attr("id", "selectG"));
                                    }
                                }
                            });

                            $("#selectA").live("click",
                                function() {
                                    $(this).remove();
                                    $("#select1 .select-all").addClass("selected").siblings().removeClass("selected");
                                });
                            $("#selectB").live("click",
                                function() {
                                    $(this).remove();
                                    $("#select2 .select-all").addClass("selected").siblings().removeClass("selected");
                                });
                            $("#selectC").live("click",
                                function() {
                                    $(this).remove();
                                    $("#select2 .select-all").addClass("selected").siblings().removeClass("selected");
                                });
                            $("#selectD").live("click",
                                function() {
                                    $(this).remove();
                                    $("#select2 .select-all").addClass("selected").siblings().removeClass("selected");
                                });
                            $("#selectE").live("click",
                                function() {
                                    $(this).remove();
                                    $("#select2 .select-all").addClass("selected").siblings().removeClass("selected");
                                });
                            $("#selectF").live("click",
                                function() {
                                    $(this).remove();
                                    $("#select2 .select-all").addClass("selected").siblings().removeClass("selected");
                                });
                            $("#selectG").live("click",
                                function() {
                                    $(this).remove();
                                    $("#select2 .select-all").addClass("selected").siblings().removeClass("selected");
                                });
                            $(".select li").live("click",
                                function() {
                                    if ($("#select-result li").length > 1) {
                                        $("#select-no").hide();
                                    } else {
                                        $("#select-no").show();
                                    }
                                });
                            $("a").click(function(){
                                // 取得要提交的参数
                                // 创建Form
                                var form = $('<form></form>');
                                // 设置属性
                                form.attr('action', '/index.php');
                                form.attr('method', 'get');
                                // 创建Input
                                var my_c = $('<input type="hidden" name="c" value="search"/>');
                                var my_mid = $('<input type="hidden" name="mid" value="news"/>');
                                var my_m = $('<input type="hidden" name="m" value="index"/>');
                                form.append(my_c);
                                form.append(my_mid);
                                form.append(my_m);
                                $("#selected").each(function () {
                                    var value = $.trim($(this).children("a").attr('class'));
                                    var name = $.trim($(this).children("a").attr('id'));
                                    console.log(name,value);
                                    var my_input = $('<input type="hidden" />');
                                    my_input.attr('name', name);
                                    my_input.attr('value', value);
                                    form.append(my_input);
                                });
                                // 附加到Form
                                //附加到document
                                $(document.body).append(form);
                                //console.log(form);
                                // 提交表单
//                                form.submit();
                            });
                        });
                    </script>
                    <ul class="list" id="select-result">
                        <li>已选条件：</li>
                        <li id="select-no">无</li>
                    </ul>
                    <ul class="list" id="select1">
                        <li>生活型：</li>
                        <li class="select-all selected"><a href="#">全部</a></li>
                        <?php $field = dr_field_options('shx','1','news');  if (is_array($field)) { $count=count($field);foreach ($field as $value=>$name) { ?>
                        <li><a href="javascript:;" id="shx" class="<?php echo $value; ?>"><?php echo $name; ?></a></li>
                        <?php } } ?>
                    </ul>
                    <ul class="list" id="select2">
                        <li>湿地类型：</li>
                        <li class="select-all selected"><a href="#">全部</a></li>
                        <?php $field = dr_field_options('sdlx','1','news');  if (is_array($field)) { $count=count($field);foreach ($field as $value=>$name) { ?>
                        <li><a href="javascript:;" id="sdlx" class="<?php echo $value; ?>"><?php echo $name; ?></a></li>
                        <?php } } ?>
                    </ul>

                    <ul class="list" id="select3">
                        <li>污水类型：</li>
                        <li class="select-all selected"><a href="#" >全部</a></li>
                        <?php $field = dr_field_options('wslxx','1','news');  if (is_array($field)) { $count=count($field);foreach ($field as $value=>$name) { ?>
                        <li><a href="javascript:;" id="wslxx" class="<?php echo $value; ?>"><?php echo $name; ?></a></li>
                        <?php } } ?>
                    </ul>
                    <ul class="list" id="select4">
                        <li>观赏特性：</li>
                        <li class="select-all selected"><a href="#">全部</a></li>
                        <?php $field = dr_field_options('gstxx','1','news');  if (is_array($field)) { $count=count($field);foreach ($field as $value=>$name) { ?>
                        <li><a href="javascript:;" id="gstxx" class="<?php echo $value; ?>"><?php echo $name; ?></a></li>
                        <?php } } ?>
                    </ul>
                    <ul class="list" id="select5">
                        <li>季象：</li>
                        <li class="select-all selected"><a href="#" >全部</a></li>
                        <?php $field = dr_field_options('jx','1','news');  if (is_array($field)) { $count=count($field);foreach ($field as $value=>$name) { ?>
                        <li><a href="javascript:;" id="jx" class="<?php echo $value; ?>"><?php echo $name; ?></a></li>
                        <?php } } ?>
                    </ul>
                    <ul class="list" id="select6">
                        <li>水深范围：</li>
                        <li class="select-all selected"><a href="#" >全部</a></li>
                        <?php $field = dr_field_options('ssfww','1','news');  if (is_array($field)) { $count=count($field);foreach ($field as $value=>$name) { ?>
                        <li><a href="javascript:;" id="ssfww" class="<?php echo $value; ?>"><?php echo $name; ?></a></li>
                        <?php } } ?>
                    </ul>
                    <ul class="list" id="select7">
                        <li>气候类型：</li>
                        <li class="select-all selected"><a href="#" >全部</a></li>
                        <?php $field = dr_field_options('qhlx','1','news');  if (is_array($field)) { $count=count($field);foreach ($field as $value=>$name) { ?>
                        <li><a href="javascript:;" id="qhlx" class="<?php echo $value; ?>"><?php echo $name; ?></a></li>
                        <?php } } ?>
                    </ul>
                <!--</form>-->
                <script>
                    $(document).ready(function() {

                    })
                </script>
            </div>
