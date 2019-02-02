LABEL1=0.8;
LABEL2=0.5;
LABEL3="Seam";
 
corner_rad=6;
cube_side=16;
cube_height=15;
box=cube_side-corner_rad;
 
text_ht=4; // height of text as written
text_base=0.2; // pedastal of font
text_top=1.0; // tapered height top of font
text_fraction=4/6; // width at top of taper
text_thk=0.6; //thickness of extruded object
 
font = "Swis721 LtEx BT:style=Light";

  
module BoxWithRoundedCorners() {
  translate([0, 0, -cube_height/2])
    linear_extrude(height=cube_height)
    offset(r=corner_rad, $fn=corner_rad*24)
    square([2*box, 2*box], center=true);
    }



module Lables() {
$fa=1; 
$fs=0.4;
/*translate ([0,3*text_ht,cube_side/2]) rotate([0,0,0]) color("red")  
minkowski() { linear_extrude(text_base)
    text(text = str("Seam Hiding"), font = font, size = text_ht, spacing=1.0, halign="center", valign="center");
    linear_extrude(text_top, scale = text_fraction) square(text_thk,true);
    }
*/
translate ([0,2*text_ht,cube_height/2]) rotate([0,0,0]) color("red")  
minkowski() { linear_extrude(text_base)
    text(text = str("Depth=",LABEL1), font = font, size = text_ht, spacing=1.0, halign="center", valign="center");
    linear_extrude(text_top, scale = text_fraction) square(text_thk,true);
    }
 
translate ([0,0*text_ht, cube_height/2]) rotate([0,0,0]) color("green")  
minkowski() { linear_extrude(text_base)
    text(text = str("Gap=",LABEL2), font = font, size = text_ht, spacing=1.0, halign="center", valign="center");
    linear_extrude(text_top, scale = text_fraction) square(text_thk,true);
    }    
 
translate ([0,-2*text_ht,cube_height/2]) rotate([0,0,0]) color("yellow")
minkowski() { linear_extrude(text_base)
    text(text = str(LABEL3),  font = font, size = text_ht, spacing=1.0, halign="center", valign="center");
    linear_extrude(text_top, scale = text_fraction) square(text_thk,true);
    }
}
union () {
    BoxWithRoundedCorners();
    Lables();
}
