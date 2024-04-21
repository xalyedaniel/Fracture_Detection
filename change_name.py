import yaml
import sys

def change_name(new_proj_name):
    with open("./ultralytics/cfg/default.yaml") as istream:
        y = yaml.safe_load(istream)
        y['name'] = new_proj_name
        
    with open("./ultralytics/cfg/default.yaml", "w") as ostream:
        yaml.dump(y, ostream, default_flow_style=False, sort_keys=False)
        
if __name__ == '__main__':
    name = sys.argv[1]
    change_name(name)