import os, time, subprocess

extract_script_path = '/home/void/.bin/ex.sh'
pack_script_path = '/home/void/.bin/pk.sh'

files = [f for f in os.listdir('.') if os.path.isfile(f)]

def strip_ext(s):
    return s.split('.')[0]


def process_book_filename(s):
    s = s.replace('-', '_')
    s = s.replace('__', '_')

    s = s[:s.find('_')] + '_' + s[s.find('_'):]

    return s


def byte_to_str(b):
    return str(b)[2:-1]

def run(s, out=False):
    if isinstance(s, str):
        cmd = s
        args = s.split()

    elif isinstance(s, list):
        cmd = ' '.join(s)
        args = s

    print('CMD:', cmd)

    if out:
        return byte_to_str(subprocess.check_output(args))
    else:
        return subprocess.call(args)

for zipped_filename in files:
    # import pdb;pdb.set_trace()

    if zipped_filename[-8:] != '.fb2.zip':
        continue

    processed_zipped_filename = process_book_filename(zipped_filename)
    os.rename(zipped_filename, processed_zipped_filename)
    zipped_filename = processed_zipped_filename # AAA__bbb.fb2.zip

    res = run(['bash', extract_script_path, zipped_filename], out=True)
    extracted_filename = res.split('\\n')[1][13:].strip() # 1111111.fb2

    zipped_name = strip_ext(zipped_filename) # AAA_bbb
    extracted_name = strip_ext(extracted_filename) # 11111111
    
    if extracted_filename[-4:] != '.fb2':
        continue

    result_filename = f'{zipped_name}.fb2' # AAA__bbb.fb2
    os.rename(extracted_filename, result_filename)

    run(['rm', zipped_filename])

    run(['bash', pack_script_path, 'zip', result_filename])

    run(['rm', result_filename])
    
    # created = run('/bin/ls *.fb2', out=True)
    # created = subprocess.check_output(['pwd'])
    # print('Created: ', created)
