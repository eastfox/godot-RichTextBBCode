@tool
extends RichTextEffect
class_name RichTextMatrix

# Syntax: [matrix clean=2.0 dirty=1.0 span=50][/matrix]
var bbcode = "matrix"

func get_text_server():
	return TextServerManager.get_primary_interface()

func _process_custom_fx(char_fx):
	# 获取参数
	var clear_time = char_fx.env.get("clean", 2.0)
	var dirty_time = char_fx.env.get("dirty", 1.0)
	var text_span = char_fx.env.get("span", 50)
	
	# 保存原始字符索引（关键修复）
	var original_glyph = char_fx.glyph_index
	
	# 计算相位偏移的时间
	var t = fmod(char_fx.elapsed_time + (char_fx.range.x / float(text_span)), 
				clear_time + dirty_time)
	
	# 反转动画逻辑：先随机后清晰
	if t < dirty_time:
		# 随机字符阶段
		var value = randi() % 62  # 0-61范围
		value += 48 if value < 10 else (55 if value < 36 else 61)
		char_fx.glyph_index = get_text_server().font_get_glyph_index(char_fx.font, 1, value, 0)
	else:
		# 恢复原始字符阶段
		char_fx.glyph_index = original_glyph
	
	return true
