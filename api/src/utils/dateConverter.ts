export const dateConverter = (dateString: string): Date => {
  // Exemple input format: 25/10/2021
  const dateArray = dateString.split('/')
  const [day, month, year] = dateArray.map((datePart): number => {
    return parseInt(datePart, 10)
  })

  return new Date(year, month - 1, day)
}
