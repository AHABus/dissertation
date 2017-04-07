TEX 		:= pdflatex
BIB 		:= biber
TARGET 		:= paper
CH_DIR		:= ./chapters
CHAPTERS 	:= $(wildcard $(CH_DIR)/*.tex)

all: open

compile:
	@$(TEX) -shell-escape $(TARGET).tex
	@$(BIB) $(TARGET) > /dev/null
	@makeglossaries $(TARGET)
	@$(TEX) -shell-escape $(TARGET).tex > /dev/null
	@$(TEX) -shell-escape $(TARGET).tex > /dev/null
	@clear

open: compile
	@open $(TARGET).pdf

count: $(CHAPTERS)
	@echo $(CHAPTERS)
	@echo "[done]"
	

$(CH_DIR)/%.tex:
	@echo "[chapter: $@]"
	@texcount -nosub $@
	


clean:
	@rm -rf *.aux
	@rm -rf *.xml
	@rm -rf *.out
	@rm -rf *.lot
	@rm -rf *.lof
	@rm -rf *.blg
	@rm -rf *.bcf
	@rm -rf *.bbl
	@rm -rf *.log
	@rm -rf *.toc
	@rm -rf *.gls
	@rm -rf *.glo
	@rm -rf *.ist
	@rm -rf *.acn
	@rm -rf *.acr
	@rm -rf *.alg
	@rm -rf *.lot
	@rm -rf *.lof
	@rm -rf _minted-$(TARGET)