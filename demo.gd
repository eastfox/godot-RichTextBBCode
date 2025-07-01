extends Node2D
var text : Array[String]
var size : int
var counter : int = 0

func _ready() -> void:
	text.append("普通字\t\t[b]加粗[/b]\t\t[i]斜体[/i]\t\t[i][b]加粗斜体[/b][/i]")
	text.append("[u]下划线[/u]\t\t[s]删除线！[/s]")
	text.append("[color=red]红色字体[/color]\t\t[fgcolor=#49c9]前景[color=red]色[/color][/fgcolor]\t\t[bgcolor=#49c9]背景[color=#4cf]色[/color][/bgcolor]")
	# img=第一个指定点，第二个指定点，宽度x高度
	text.append("图片前文字[img=top,center,60x60]res://unicorn_icon.png[/img]图片后文字")
	text.append("[font_size=24]字体大小[/font_size]")
	text.append("[color=aqua][url=https://godotengine.org]自定义连接[/url][/color]")
	text.append("[hint=这是悬浮显示内容。]悬停此处显示悬浮显示内容[/hint]")
	text.append("[left]左对齐[/left]")
	text.append("[center]居中[/center]")
	text.append("[right]右对齐[/right]")
	# 脉动效果：freq：频率，默认为1.0；color：目标颜色，默认为透明度40%的白色；ease：变化度，默认为-2.0
	text.append("[pulse freq=1.0 color=#ffffff40 ease=-2.0]脉动效果[/pulse]")
	# 渐隐效果：start：渐隐起始位置；length：渐隐长度
	text.append("[fade start=0 length=4]渐隐效果[/fade]")
	# 霓虹效果：freq：频率，默认为1.0；sat：饱和度；val：霓虹亮度，0为纯黑；speed：动画播放速度，正数为向右变化，负数为向左变化，0则暂停
	text.append("[rainbow freq=1.0 sat=0.8 val=1.0 speed=1.0]霓虹效果[/rainbow]")
	# 波动、龙卷风、抖动效果可能会超出文本框范围，默认会被裁剪，需要取消勾选富文本标签检查器-Control-Layout-Clip Content
	# 波动效果：amp：波动高低，默认为50.0；freq：频率，默认为5.0；connected：是否连带，默认为1，为0时可以解决字体连接的某些渲染问题
	text.append("[wave amp=50.0 freq=5.0 connected=1]波动效果[/wave]")
	# 龙卷风效果：radius：偏移量半径，默认为10.0；freq：频率，默认为1.0；connected：是否连带，默认为1，为0时可以解决字体连接的某些渲染问
	text.append("[tornado radius=10.0 freq=5.0 connected=1]龙卷风效果[/tornado]")
	# 抖动效果：rate：抖动速度，默认为20.0；level：抖动幅度，默认为5；connected：是否连带，默认为1，为0时可以解决字体连接的某些渲染问
	text.append("[shake rate=20.0 level=5 connected=1]抖动效果[/shake]")
	text.append("[ghost freq=5.0 span=1.0]幽灵效果[/ghost]")
	text.append("[matrix clean=2.0 dirty=1.0 span=50]字符变化效果[/matrix]")
	size = text.size()

func _on_timer_timeout() -> void:
	if counter >= size:
		counter = 0
	show_text(counter)
	counter += 1

func show_text(i : int) -> void:
	$RichTextLabel.text = text[i]
