interface ICreateDrugDTO {
  id?: string
  name: string
  active_principle: string
  shape: string
  concentration: string
  inclusion_date: Date
  reference_drug_id: string
}

export { ICreateDrugDTO }
