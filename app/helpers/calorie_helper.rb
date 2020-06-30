module CalorieHelper
  def calorie(meal)
    total_cal = 0
    meal.doses.each do |dose|
      total_cal += (dose.ingredient.proteins) * 4
      total_cal += (dose.ingredient.fats) * 8
      total_cal += (dose.ingredient.carbs) * 4
    end
    total_cal
  end


  def calculate_macro(ingredient)
    prot_ing = 0
    lipid_ing = 0
    carbs_ing = 0
    prot_ing = params[:quantity] * ingredient.proteins
    lipid_ing = params[:quantity] * ingredient.fats
    carbs_ing = params[:quantity] * ingredient.carbs
    macro = [prot_ing, lipid_ing, carbs_ing]
  end
end

  def macro(meal)
    prot_ing = lipid_ing = carbs_ing = 0
    meal.doses.each do |dose|
      prot_ing += (dose.ingredient.proteins * dose.quantity)/100
      lipid_ing += (dose.ingredient.fats  * dose.quantity)/100
      carbs_ing += (dose.ingredient.carbs * dose.quantity)/100
    end
    [["protein", prot_ing], ["lipid",lipid_ing], ["carbs", carbs_ing]]
  end
