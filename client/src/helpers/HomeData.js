export const homeData = function(footprints){

  return footprints.map(function(footprint){
    let score = 0.0
    if (footprint.renewable_energy === true){
      score += 1.5;
    }
    if (footprint.cold_water_wash === true){
      score += 0.247;
    }
    if (footprint.recycle === true){
      score += 0.2125;
    }
    if (footprint.tumble_dryer === false){
      score += 0.21;
    }
    if (footprint.energy_saving_lightbulbs === true){
      score += 0.1;
    }
    return score;
  })
}
