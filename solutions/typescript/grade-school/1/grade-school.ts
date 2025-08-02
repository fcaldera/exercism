export class GradeSchool {
  private readonly data: Map<number, string[]> = new Map();

  constructor() {}

  roster(): Record<number, string[]> {
    const result: Record<number, string[]> = {};

    for (const [k, v] of this.data.entries()) {
      result[k] = [...v];
    }

    return result;
  }

  add(student: string, grade: number) {
    for (const students of this.data.values()) {
      const index = students.indexOf(student);
      if (index != -1) {
        students.splice(index, 1);
      }
    }

    const students = this.data.get(grade) || [];
    const index = this.findInsertionPoint(students, student);
    students.splice(index, 0, student);
    this.data.set(grade, students);
  }

  grade(n: number) {
    const info = this.data.get(n) || [];
    return [...info];
  }

  private findInsertionPoint(array: string[], entry: string) {
    let low = 0;
    let high = array.length;

    while (low < high) {
      const mid = Math.floor((low + high) / 2);

      if (array[mid] < entry) {
        low = mid + 1;
      } else {
        high = mid;
      }
    }

    return low;
  }
}
