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
//                                if($(this).children("a").text() == "全部") {
//                                    $(this).parent("ul").find("li").siblings().removeClass();
//                                    $(this).children("a").css({"background": "#10ac5f", "color": "#FFF"})
//                                }
                                $(this).addClass("selecting").siblings().removeClass("selecting");
                                if ($(this).hasClass("select-all")) {
                                    $("#selectA").remove();
                                } else {
                                    var copyThisA = $(this).clone();
                                    if ($("#selectA").length > 0) {
                                        $("#selectA").html($(this).children("a").clone());
                                    } else {
                                        $("#select-result").append(copyThisA.attr("id", "selectA"));
                                    }
                                }
                                form();
                            });
                            $("#select2 li").click(function() {
                                $(this).addClass("selecting").siblings().removeClass("selecting");
                                if ($(this).hasClass("select-all")) {
                                    $("#selectB").remove();
                                } else {
                                    var copyThisB = $(this).clone();
                                    if ($("#selectB").length > 0) {
                                        $("#selectB").html($(this).children("a").clone());
                                    } else {
                                        $("#select-result").append(copyThisB.attr("id", "selectB"));
                                    }
                                }
                                form();
                            });
                            $("#select3 li").click(function() {
                                $(this).addClass("selecting").siblings().removeClass("selecting");
                                if ($(this).hasClass("select-all")) {
                                    $("#selectC").remove();
                                } else {
                                    var copyThisC = $(this).clone();
                                    if ($("#selectC").length > 0) {
                                        $("#selectC").html($(this).children("a").clone());
                                    } else {
                                        $("#select-result").append(copyThisC.attr("id", "selectC"));
                                    }
                                }
                                form();
                            });
                            $("#select4 li").click(function() {
                                $(this).addClass("selecting").siblings().removeClass("selecting");
                                if ($(this).hasClass("select-all")) {
                                    $("#selectD").remove();
                                } else {
                                    var copyThisD = $(this).clone();
                                    if ($("#selectD").length > 0) {
                                        $("#selectD").html($(this).children("a").clone());
                                    } else {
                                        $("#select-result").append(copyThisD.attr("id", "selectD"));
                                    }
                                }
                                form();
                            });
                            $("#select5 li").click(function() {
                                $(this).addClass("selecting").siblings().removeClass("selecting");
                                if ($(this).hasClass("select-all")) {
                                    $("#selectE").remove();
                                } else {
                                    var copyThisE = $(this).clone();
                                    if ($("#selectE").length > 0) {
                                        $("#selectE").html($(this).children("a").clone());
                                    } else {
                                        $("#select-result").append(copyThisE.attr("id", "selectE"));
                                    }
                                }
                                form();
                            });
                            $("#select6 li").click(function() {
                                $(this).addClass("selecting").siblings().removeClass("selecting");
                                if ($(this).hasClass("select-all")) {
                                    $("#selectF").remove();
                                } else {
                                    var copyThisF = $(this).clone();
                                    if ($("#selectF").length > 0) {
                                        $("#selectF").html($(this).children("a").clone());
                                    } else {
                                        $("#select-result").append(copyThisF.attr("id", "selectF"));
                                    }
                                }
                                form();

                            });
                            $("#select7 li").click(function() {
                                $(this).addClass("selecting").siblings().removeClass("selecting");
                                if ($(this).hasClass("select-all")) {
                                    $("#selectG").remove();
                                } else {
                                    var copyThisG = $(this).clone();
                                    if ($("#selectG").length > 0) {
                                        $("#selectG").html($(this).children("a").clone());
                                    } else {
                                        $("#select-result").append(copyThisG.attr("id", "selectG"));
                                    }
                                }
                                form();
                            });

                            $("#selectA").live("click",
                                function() {
                                    $(this).remove();
                                    $("#select1 .select-all").addClass("selecting").siblings().removeClass("selecting");
                                });
                            $("#selectB").live("click",
                                function() {
                                    $(this).remove();
                                    $("#select2 .select-all").addClass("selecting").siblings().removeClass("selecting");
                                });
                            $("#selectC").live("click",
                                function() {
                                    $(this).remove();
                                    $("#select3 .select-all").addClass("selecting").siblings().removeClass("selecting");
                                });
                            $("#selectD").live("click",
                                function() {
                                    $(this).remove();
                                    $("#select4 .select-all").addClass("selecting").siblings().removeClass("selecting");
                                });
                            $("#selectE").live("click",
                                function() {
                                    $(this).remove();
                                    $("#select5 .select-all").addClass("selecting").siblings().removeClass("selecting");
                                });
                            $("#selectF").live("click",
                                function() {
                                    $(this).remove();
                                    $("#select6 .select-all").addClass("selecting").siblings().removeClass("selecting");
                                });
                            $("#selectG").live("click",
                                function() {
                                    $(this).remove();
                                    $("#select7 .select-all").addClass("selecting").siblings().removeClass("selecting");
                                });
                            $(".select li").live("click",
                                function() {
                                    if ($("#select-result li").length > 1) {
                                        $("#select-no").hide();
                                    } else {
                                        $("#select-no").show();
                                    }
                                });
//                            $("li").click(function(){
                                $("#select-result>.selecting").each(function() {
                                    var color = $.trim($(this).children("a").attr('class'));
                                    console.log(color);
                                    $("a[class = "+color+"]").css({"background": "#10ac5f", "color": "#FFF"})
//                                    $("a[class != "+color+"]").css();
                                })
//                            });
                        });
                        function form() {
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
                                $("#select-result>.selecting").each(function () {
                                    var value = $.trim($(this).children("a").attr('class'));
                                    var name = $.trim($(this).children("a").attr('id'));
                                    var my_input = $('<input type="hidden" />');
                                    my_input.attr('name', name);
                                    my_input.attr('value', value);
                                    form.append(my_input);
                                });
                                //附加到Form
                                //附加到document
                                $(document.body).append(form);
                                // 提交表单
                                form.submit();
                        }

                    </script>
                    <ul class="list" id="select-result" style="display: none">
                        <li>已选条件：</li>
                        <?php if (!isset($inputshx)) :?><li id="select-no">无</li>
                        <?php else : echo $inputshx;  endif;?>
                    </ul>
                    <ul class="list" id="select1">
                        <li>生活型：</li>
                        <li class="select-all selected"><a href="javascript:;" <?php if (!isset($_GET['shx'])):?> style="background: #10ac5f;color: #FFF"<?php endif;?>>全部</a></li>
                        <?php $field = dr_field_options('shx','1','news');  if (is_array($field)) { $count=count($field);foreach ($field as $value=>$name) { ?>
                        <li><a href="javascript:;" id="shx" class="<?php echo $value; ?>"><?php echo $name; ?></a></li>
                        <?php } } ?>
                    </ul>
                    <ul class="list" id="select2">
                        <li>湿地类型：</li>
                        <li class="select-all selected"><a href="javascript:;" <?php if (!isset($_GET['sdlx'])):?> style="background: #10ac5f;color: #FFF"<?php endif;?> >全部</a></li>
                        <?php $field = dr_field_options('sdlx','1','news');  if (is_array($field)) { $count=count($field);foreach ($field as $value=>$name) { ?>
                        <li><a href="javascript:;" id="sdlx" class="<?php echo $value; ?>"><?php echo $name; ?></a></li>
                        <?php } } ?>
                    </ul>

                    <ul class="list" id="select3">
                        <li>污水类型：</li>
                        <li class="select-all selected"><a href="javascript:;" <?php if (!isset($_GET['wslxx'])):?> style="background: #10ac5f;color: #FFF"<?php endif;?> >全部</a></li>
                        <?php $field = dr_field_options('wslxx','1','news');  if (is_array($field)) { $count=count($field);foreach ($field as $value=>$name) { ?>
                        <li><a href="javascript:;" id="wslxx" class="<?php echo $value; ?>"><?php echo $name; ?></a></li>
                        <?php } } ?>
                    </ul>
                    <ul class="list" id="select4">
                        <li>观赏特性：</li>
                        <li class="select-all selected"><a href="javascript:;" <?php if (!isset($_GET['gstxx'])):?> style="background: #10ac5f;color: #FFF"<?php endif;?> >全部</a></li>
                        <?php $field = dr_field_options('gstxx','1','news');  if (is_array($field)) { $count=count($field);foreach ($field as $value=>$name) { ?>
                        <li><a href="javascript:;" id="gstxx" class="<?php echo $value; ?>"><?php echo $name; ?></a></li>
                        <?php } } ?>
                    </ul>
                    <ul class="list" id="select5">
                        <li>季象：</li>
                        <li class="select-all selected"><a href="javascript:;" <?php if (!isset($_GET['jx'])):?> style="background: #10ac5f;color: #FFF"<?php endif;?> >全部</a></li>
                        <?php $field = dr_field_options('jx','1','news');  if (is_array($field)) { $count=count($field);foreach ($field as $value=>$name) { ?>
                        <li><a href="javascript:;" id="jx" class="<?php echo $value; ?>"><?php echo $name; ?></a></li>
                        <?php } } ?>
                    </ul>
                    <ul class="list" id="select6">
                        <li>水深范围：</li>
                        <li class="select-all selected"><a href="javascript:;" <?php if (!isset($_GET['ssfww'])):?> style="background: #10ac5f;color: #FFF"<?php endif;?> >全部</a></li>
                        <?php $field = dr_field_options('ssfww','1','news');  if (is_array($field)) { $count=count($field);foreach ($field as $value=>$name) { ?>
                        <li><a href="javascript:;" id="ssfww" class="<?php echo $value; ?>"><?php echo $name; ?></a></li>
                        <?php } } ?>
                    </ul>
                    <ul class="list" id="select7">
                        <li>气候类型：</li>
                        <li class="select-all selected"><a href="javascript:;" <?php if (!isset($_GET['qhlx'])):?> style="background: #10ac5f;color: #FFF"<?php endif;?> >全部</a></li>
                        <?php $field = dr_field_options('qhlx','1','news');  if (is_array($field)) { $count=count($field);foreach ($field as $value=>$name) { ?>
                        <li><a href="javascript:;" id="qhlx" class="<?php echo $value; ?>"><?php echo $name; ?></a></li>
                        <?php } } ?>
                    </ul>
                <!--</form>-->
            </div>
