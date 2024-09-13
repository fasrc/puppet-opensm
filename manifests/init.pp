# opensm sets up opensm and runs it
class opensm (
){
  ensure_packages(['opensm'], {'ensure' => present})
}
