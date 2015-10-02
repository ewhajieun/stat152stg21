# stat152stg21
# Clone the repository from GitHub
git clone https://github.com/rstudio/shiny-server.git

# Get into a temporary directory in which we'll build the project
cd shiny-server
mkdir tmp
cd tmp

# Add the bin directory to the path so we can reference node
DIR=`pwd`
PATH=$DIR/../bin:$PATH

# See the "Python" section below if your default python version is not 2.6 or 2.7. 
PYTHON=`which python`

# Check the version of Python. If it's not 2.6.x or 2.7.x, see the Python section below.
$PYTHON --version

# Use cmake to prepare the make step. Modify the "--DCMAKE_INSTALL_PREFIX"
# if you wish the install the software at a different location.
cmake -DCMAKE_INSTALL_PREFIX=/usr/local -DPYTHON="$PYTHON" ../
# Get an error here? Check the "How do I set the cmake Python version?" question below

# Recompile the npm modules included in the project
make
mkdir ../build
(cd .. && ./bin/npm --python="$PYTHON" rebuild)
# Need to rebuild our gyp bindings since 'npm rebuild' won't run gyp for us.
(cd .. && ./bin/node ./ext/node/lib/node_modules/npm/node_modules/node-gyp/bin/node-gyp.js --python="$PYTHON" rebuild)

# Install the software at the predefined location
sudo make install
