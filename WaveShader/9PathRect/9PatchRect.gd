tool
extends Control


export(Texture) var custom_texture


func _process(delta):
	update()
	
	#Reposition
	#set_position(-(rect_size / 2.0))


func _draw() -> void:
	#Draw 9 Patch
	
	var w = 11
	var px = 0
	var py = 0
	var sx = rect_size.x - w
	var sy = rect_size.y - w
	
	#Center
	draw_texture_rect_region(custom_texture, Rect2(Vector2(w, w), Vector2(sx - w, sy - w)), Rect2(Vector2(11, 11), Vector2(11, 11)))
	
	#Sides
	
	#Top
	draw_texture_rect_region(custom_texture, Rect2(Vector2(w, py), Vector2(sx - w, w)), Rect2(Vector2(11, 0), Vector2(11, 11)))
	#Bottom
	draw_texture_rect_region(custom_texture, Rect2(Vector2(w, sy), Vector2(sx - w, w)), Rect2(Vector2(11, 22), Vector2(11, 11)))
	#Left
	draw_texture_rect_region(custom_texture, Rect2(Vector2(px, w), Vector2(w, sy - w)), Rect2(Vector2(0, 11), Vector2(11, 11)))
	#Right
	draw_texture_rect_region(custom_texture, Rect2(Vector2(sx, w), Vector2(w, sy - w)), Rect2(Vector2(22, 11), Vector2(11, 11)))
	
	#Corners
	
	#Top Left
	draw_texture_rect_region(custom_texture, Rect2(Vector2(px, py), Vector2(w, w)), Rect2(Vector2(0, 0), Vector2(11, 11)))
	#Top Right
	draw_texture_rect_region(custom_texture, Rect2(Vector2(sx, py), Vector2(w, w)), Rect2(Vector2(22, 0), Vector2(11, 11)))
	#Bottom Left
	draw_texture_rect_region(custom_texture, Rect2(Vector2(px, sy), Vector2(w, w)), Rect2(Vector2(0, 22), Vector2(11, 11)))
	#Bottom Right
	draw_texture_rect_region(custom_texture, Rect2(Vector2(sx, sy), Vector2(w, w)), Rect2(Vector2(22, 22), Vector2(11, 11)))
	
