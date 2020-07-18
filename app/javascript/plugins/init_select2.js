import $ from 'jquery';
import 'select2';
import 'select2/dist/css/select2.css';

const initSelect2 = () => {
  // const formElements = document.querySelectorAll(".simple_form.new_dose")
  // console.log(formElements)
  // formElements.forEach((formElement) => {
  //   $(this).find(".select2").select2()
  // })
  // $('.select2').each(function(select) {
  //   console.log(this);
  //   $(this).select2();
  // }); // (~ document.querySelectorAll)
  const dataMealIdsDiv = document.querySelector('div[data-meal-ids]')
  let mealIds = dataMealIdsDiv.dataset.mealIds
  mealIds = mealIds.substr(1)
  mealIds = mealIds.substring(0, mealIds.length - 1)
  mealIds = mealIds.split(', ')
  console.log(mealIds)
  mealIds.forEach(id => {
    $(`#select2-${id}`).select2()
  })
};

export { initSelect2 };
