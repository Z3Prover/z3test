from z3 import *
from os import listdir
import pathlib

INCORRECT_STATE_CODE = -1


def check_model(chc: AstVector, model: ModelRef) -> int:
    solver = Solver()
    clause_num = 0
    for clause in chc:
        inter_clause = model.eval(clause)
        solver.add(inter_clause)
        model_state = solver.check()
        if model_state == unsat:
            break
        clause_num += 1
    return clause_num


def check(chc: AstVector, expected_state: str) -> int:
    solver = SolverFor('HORN')
    solver.set('engine', 'spacer')

    solver.add(chc)

    if expected_state != str(solver.check()):
        return INCORRECT_STATE_CODE
    if expected_state == 'sat':
        model = solver.model()
        return check_model(chc, model)
    return len(chc)


def get_files_info(benchmarks_dir) -> dict:
    files_info = dict()
    cur_path = pathlib.Path(__file__).parent.parent.resolve()
    path = str(cur_path) + '/' + benchmarks_dir + '/'
    for filename in listdir(path):
        if filename.endswith('.smt2'):
            filename = path + filename
            out_filename = filename[:-4] + 'expected.out'
            with open(out_filename, 'r') as out_file:
                expected_state = out_file.readline().rstrip()
                files_info[filename] = expected_state
    return files_info


def main(benchmarks_dir: str = 'smt2-chc'):
    files_info = get_files_info(benchmarks_dir)
    for filename in files_info:
        chc = parse_smt2_file(filename)
        expected_state = files_info[filename]
        code = check(chc, expected_state)
        if code == INCORRECT_STATE_CODE:
            raise Exception('Incorrect state: %s' % filename)
        elif code < len(chc):
            raise Exception('Incorrect model: %s, clause: %s' % (filename, str(code)))


if __name__ == "__main__":
    main()
