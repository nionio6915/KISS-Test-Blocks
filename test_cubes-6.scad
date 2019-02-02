$fn=6*24;
LABEL1=0.8;
LABEL2=0.5;
LABEL3="Seam";
 
corner_rad=6;
cube_side=13;
cube_height=20;
box=cube_side-corner_rad;
 
text_ht=4; // height of text as written
text_base=0.2; // pedastal of font
text_top=1.0; // tapered height top of font
text_fraction=4/6; // width at top of taper
text_thk=0.6; //thickness of extruded object
 
// font = "Swis721 LtEx BT:style=Light";

font = "Liberation Sans:style=Bold";
  
module BoxWithRoundedCorners()
/*  translate([0, 0, -cube_height/2])
    linear_extrude(height=cube_height)
    offset(r=corner_rad, $fn=corner_rad*24)
    square([2*box, 2*box], center=true);
    }
*/
    hull() {
    translate([  box,  box,  0]) cylinder(h=cube_height, r1=corner_rad, r2=corner_rad, center=true);
    translate([  box, -box,  0]) cylinder(h=cube_height, r1=corner_rad, r2=corner_rad, center=true); 
    translate([ -box, -box,  0]) cylinder(h=cube_height, r1=corner_rad, r2=corner_rad, center=true);
    translate([ -box,  box,  0]) cylinder(h=cube_height, r1=corner_rad, r2=corner_rad, center=true);      
  }


module Lables() {
$fa=1; 
$fs=0.4;
translate ([0,2*text_ht,-.01+cube_height/2]) rotate([0,0,0]) color("red")  
linear_extrude(height=text_thk) {
    text(text = str("SD=",LABEL1), font = font, size = text_ht, spacing=1.0, halign="center", valign="center", $fn=16);
}
    

translate ([0,0*text_ht,-.01+ cube_height/2]) rotate([0,0,0]) color("green")  
linear_extrude(height=text_thk) {
    text(text = str("SG=",LABEL2), font = font, size = text_ht, spacing=1.0, halign="center", valign="center", $fn=16);
    }    
 
translate ([0,-2*text_ht,-.01+cube_height/2]) rotate([0,0,0]) color("yellow")
linear_extrude(height=text_thk){
    text(text = str(LABEL3),  font = font, size = text_ht, spacing=1.0, halign="center", valign="center", $fn=16);
    }

}
    
union () {
    BoxWithRoundedCorners();
    Lables();
}