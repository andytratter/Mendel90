//
// Mendel90
//
// GNU GPL v2
// nop.head@gmail.com
// hydraraptor.blogspot.com
//
// Tubing and sleeving
//

PVC64  = ["PVC aquarium tubing", 6,        4, tubing_color];
PTFE07 = ["PTFE sleeving",       1.2,   0.71, tubing_color];
PTFE20 = ["PTFE sleeving",       2.6,      2, tubing_color];
PF7 =    ["PTFE tubing",         46/10, 3.84, tubing_color];

function tubing_material(type) = type[0];
function tubing_od(type)       = type[1];
function tubing_id(type)       = type[2];
function tubing_color(type)    = type[3];

module tubing(type, length, forced_id = 0) {
    original_od = tubing_od(type);
    original_id = tubing_id(type);
    id = forced_id ? forced_id : original_id;
    od = original_od + id - original_id;
    vitamin(str("TB", round(original_od * 10), round(original_id * 10), length,": ", tubing_material(type), " OD ", original_od, "mm ID ", original_id,"mm x ",length, "mm"));
    color(tubing_color(type)) render() difference() {
        cylinder(r = od / 2, h = length,     center = true);
        cylinder(r = id / 2, h = length + 1, center = true);
    }
}
