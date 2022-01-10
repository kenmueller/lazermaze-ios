/*
 
 --- Pieces ---
 
 -^ up
 -v down
 -- up & down
 
 <| left
 |> right
 || left & right
 
 \> up right
 <\ down left
 \\ up right & down left
 
 </ up left
 /> down right
 // up left & down right
 
 :: empty
 [] block (cannot move and blocks lazers)
 
 xx star (replace empty space or prepend it to piece)
 
 --- Lazer ---
 
 ^^ up
 vv down
 
 << left
 >> right
 
 // up right or down left
 
 \\ up left or down right
 
 ~~ empty (must put around lazer, different from empty piece)
 
 If you point to the bounds of the map, it will represent the exit
 
 */

extension Level {
	static let descriptions = [
  #"""
   vv  ~~ ~~ ~~
   ::  [] :: ~~
  xx</ \> <\ ~~
   ::  xx :: >>
  """#
	]
}
