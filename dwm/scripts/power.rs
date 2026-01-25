#![allow(dead_code)]

use std::fs;

#[derive(Debug, Clone, Copy)]
struct BatteryInfo{
    current_charge: Option<f32>,
    full_charge: Option<f32>,
    charging: bool,
}

const BATTERY_BASE_PATH: &'static str = "/sys/class/power_supply/BAT0";
const AC_PATH: &'static str = "/sys/class/power_supply/AC";
const OUTPUT_PATH: &'static str = "/tmp/power-info";


const BATTERY_DIVS: usize = 3;
const BATTERY_SYMBOLS: [&str; BATTERY_DIVS*2] = [
    "󱊡 ", "󱊢 ", "󱊣 ",
    "󱊤  ", "󱊥  ", "󱊦  "
];

fn main() {
    let battery_info = get_battery_info(BATTERY_BASE_PATH);
    let ac_status = get_ac_status(AC_PATH);

    let output_string = build_string(battery_info, ac_status);
    print!("{output_string}");
}

fn get_ac_status(base_path: &str) -> bool{
    fs::read_to_string(base_path.to_string() + "/online")
        .ok()
        .and_then(|s| s.trim().parse::<u8>().ok())
        .and_then(|v| Some(v == 1))
        .unwrap_or(false)
}

fn get_battery_info(base_path: &str) -> BatteryInfo{
    let full_charge = fs::read_to_string(base_path.to_string() + "/charge_full")
        .ok()
        .and_then(|s| s.trim().parse::<f32>().ok());
    
    let current_charge = fs::read_to_string(base_path.to_string() + "/charge_now")
        .ok()
        .and_then(|s| s.trim().parse::<f32>().ok());

   let charging: bool = fs::read_to_string(base_path.to_string() + "/status")
        .ok()
        .and_then(|s| Some(s.trim().to_lowercase() == "charging"))
        .unwrap_or(false);

    BatteryInfo{
        current_charge,
        full_charge,
        charging,
    }
}

fn build_string(
    battery_info: BatteryInfo,
    ac_status: bool
) -> String{ 
    let current_charge = battery_info.current_charge;
    let full_charge = battery_info.full_charge;
    let charging = battery_info.charging;

    let charge_string = current_charge
        .and_then(|cc|{
            if let Some(fc) = full_charge{
               let perc = cc/fc * 100.0f32;
               return Some(format!("{:.1}%", perc));
            }
            return None
        })
        .unwrap_or("-".to_string());
    
    if charging { return charge_string + " CH"; } 
    if ac_status { return charge_string + " AC"; }
    charge_string
}
