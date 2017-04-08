TEX 		:= pdflatex
BIB 		:= biber
TARGET 		:= paper
CH_DIR		:= ./chapters
CHAPTERS 	:= $(wildcard $(CH_DIR)/*.tex)
OUT_DIR		:= ./out

all: open

compile:
	@mkdir -p $(OUT_DIR)
	@$(TEX) -halt-on-error -output-directory $(OUT_DIR) -shell-escape $(TARGET).tex
	#@$(BIB) -output-directory $(OUT_DIR) $(TARGET) > /dev/null
	#@makeglossaries -d $(OUT_DIR) $(TARGET)
	#@$(TEX) -halt-on-error -output-directory $(OUT_DIR) -shell-escape $(TARGET).tex > /dev/null
	#@$(TEX) -halt-on-error -output-directory $(OUT_DIR) -shell-escape $(TARGET).tex > /dev/null
	@cp $(OUT_DIR)/$(TARGET).pdf ./$(TARGET).pdf
	@clear

open: compile
	@open $(TARGET).pdf

count-detailed:
	@texcount -nosub -inc -q $(TARGET).tex

count:
	@texcount -nosub -merge -q $(TARGET).tex

clean:
	@rm -rf $(OUT_DIR)