#include "Woods.inc"
#include "Metals.inc"
#include "colors.inc"
#include "textures.inc"

global_settings {
  assumed_gamma 1.0
}

// Backgrounds
background {color rgb<.01, .01, .01>}

// Camera Settings
camera {
    location
    // UNCOMMENT USED ANGLE
    //<12, 12, -16> // isometric angle
     <5, 0, -15> // horizontal angle
    look_at <0,0, 0>
}

// Ambient Light
light_source {
    <500, 120, -100> color OrangeRed
    media_attenuation on
}

// Spotlight Left
light_source {
  <0, 0, -5> color rgb<.2, .2, .2> * Magenta
  spotlight
  point_at <0,0,5>
  media_attenuation on
}

// Spotlight right
light_source {
  <2, 0, 0> color rgb<.3, .3, .3> * Cyan
  spotlight
  point_at <-3,0,0>
  media_attenuation on
}

// Spotlight text
light_source {
  <2, 0, 1> color rgb<1, 1, 1> * Red
  spotlight
  point_at <2,0,5>
  media_attenuation on
}

// Spotlight above
light_source {
  <0, 8, 0> color rgb<.51, .51, .51> * Yellow
  spotlight
  point_at <0,-8,0>  
}

// Isometric base room
#declare baseRoom =
union {
    difference {
    
        box {
            <-8,-8,-8> <8, 8, 8>

            
            texture{
                pigment { color rgb <1, .94, .75> }
                finish { ambient .2 diffuse .8}
            } 
        }
        
        box {
            <-8,-8,-8> <8, 8, 8> 
            texture{
                pigment { color rgb <1, .94, .75> }
                finish { specular .15 roughness .5 ambient .2}
            }
            translate <2, 2, -2>
        }
        

    }
    
    // floor
    box {
            <-8,-5.6,-9> <9, -5.5, 8>
            texture{
                T_Wood1 scale 3
            }
     }
    
}

// Globe Object
#declare Globe =
union {

    sphere{
        <0,0,0> 3
        texture {                                              
            pigment { Cyan }
            finish { Shiny }
        }
        translate <0,7,0>
    }
          
    // vertical beam
    cylinder {
        <0,0,0>
        <0,2,0>
        .15
        texture {
            pigment { color Black }
            finish { ambient 0.2 diffuse 0.8 }
        }
    }
    
    // arch
    difference {
    
        cylinder {
            <0,0,0>
            <0,.5,0>
            5
            texture { Sandalwood scale 5 rotate <0,45,0> finish { Shiny }  }   
        }
    
        cylinder {
            <0,-1,0>
            <0,1,0>
            4.25
            texture {
                pigment { color rgb <.6, .6, .6> }
                finish { ambient 0.2 diffuse 0.8 }
            }    
        }
    
        box{
            <-3, -1, -5>
            <5, 1, 0>
            pigment{color rgb <.6, .6, .6>}
    
        }
    
        rotate <25,0,90>
        translate <.3,7,0>
    }
    
    // arch beam
    cylinder {
        <0,0,0>
        <0,9,0>
        .15
        texture {
            Brushed_Aluminum scale 3
            finish { specular .15 roughness .1 ambient .6 }
        }
        rotate <40, 35, 10>
        translate <-1, 3.5, -2>
    }
     
    // base
    cylinder {
        <0,0,0>
        <0,.15,0>
        1.5
        texture {
            Silver1
            finish { ambient 0.2 diffuse 0.8 }
        }
    }
    
}

// Cone Object
#declare Cone =
union {

    cone {
        <0,0,0>
        3
        <0,10,0>
        1
        
        texture {
            pigment { color OrangeRed}
            finish { phong albedo 0.5 phong_size 90 }
        }
    
    }
    
    cone {
        <0,3,0>
        2.41
        <0,5,0>
        2.01
        texture { Silver1 }
    
    }
    
    cone {
        <0,6.5,0>
        1.71
        <0,8,0>
        1.41
        texture { Silver1 }
    
    }
    
    //base
    box {
        <-4,0,-4> <4,.25,4>
        texture {
            pigment { color OrangeRed }
        }
        
    }

}



// ---- Scene Composing ----
text {
  ttf "Arial.ttf" "Don't Touch" .25, 0
  pigment { Black }
  translate <0,0,5.75>
  }


object{ baseRoom }


object{

      Globe
      translate <-3, -7.1, 2>
      scale .75

}

// First Cone
object { Cone translate <-4,-11,-5> scale .5}

// Second Cone
#declare Cone_scaled = object { Cone scale .5}

#declare Cone_rotated = object {Cone_scaled rotate <-110, 40, 0>}

object {
    Cone_rotated translate <4,-3.5,4.5>
}