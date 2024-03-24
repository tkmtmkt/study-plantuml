PLANTUML_JAR_URL = https://sourceforge.net/projects/plantuml/files/plantuml.jar/download
SRC_DIR := src
OUT_DIR := out
SRCS := $(wildcard $(SRC_DIR)/*.puml)
PNGS := $(patsubst $(SRC_DIR)/%, $(OUT_DIR)/%, $(addsuffix .png, $(basename $(SRCS))))
SVGS := $(patsubst $(SRC_DIR)/%, $(OUT_DIR)/%, $(addsuffix .svg, $(basename $(SRCS))))

# Default target first; build PNGs, probably what we want most of the time
png: lib/plantuml.jar $(PNGS)

# SVG are nice-to-have but don't need to build by default
svg: lib/plantuml.jar $(SVGS)

# clean up compiled files
clean:
	rm -f lib/plantuml.jar $(PNGS) $(SVGS)

# If the JAR file isn't already present, download it
lib/plantuml.jar:
	curl -sSfL $(PLANTUML_JAR_URL) -o lib/plantuml.jar

# Each PNG output depends on its corresponding .puml file
$(OUT_DIR)/%.png: $(SRC_DIR)/%.puml
	java -Djava.awt.headless=true -jar lib/plantuml.jar -tpng $^ -o ../$(OUT_DIR)

# Each SVG output depends on its corresponding .puml file
$(OUT_DIR)/%.svg: $(SRC_DIR)/%.puml
	java -Djava.awt.headless=true -jar lib/plantuml.jar -tsvg $^ -o ../$(OUT_DIR)

# Quirk of GNU Make: https://www.gnu.org/software/make/manual/html_node/Phony-Targets.html
.PHONY: png svg clean
