#-----------------------------------------------------------------------------
# Generate the plots
#-----------------------------------------------------------------------------
# Libraries
library(here)
library(ggplot2)
library(gridExtra)
library(ggthemes)
library(latex2exp)
library(glue)
library(RColorBrewer)
library(patchwork)
#-----------------------------------------------------------------------------
# ggplot2 theme
theme_set(
  theme_clean() + 
  #theme_classic() +
    theme(plot.background = element_blank(),
          legend.background = element_rect(color = "white"),
          panel.grid.major = element_blank(), 
          panel.grid.minor = element_blank(),
          panel.spacing = unit(10, "lines")
          
          )
  
  # 
  # 
  # # Format legend
  # legend.text = element_text(size=10),
  # legend.title = element_text(size=10),
  # legend.box.background = element_blank(),
  # legend.background = element_blank(),
  # 
  # # Set title and axis labels, and format these and tick marks
  # plot.title=element_text(size=13, vjust=1.25, hjust = 0.5),
  # axis.text.x=element_text(size=10),
  # axis.text.y=element_text(size=10),
  # axis.title.x=element_text(size=10, vjust=0),
  # axis.title.y=element_text(size=10, vjust=1.25)
)
#-----------------------------------------------------------------------------
# Load data files
load(here("data/processed/pooled.Rdata"))
load(here("data/processed/wealth.Rdata"))
load(here("data/processed/mortgage.Rdata"))
load(here("data/processed/hyp_tests.RData"))
#-----------------------------------------------------------------------------
# ggplot parameters
cols=c("Distribution Regresion with cloglog link"="black",
       "Proportional Hazard"="red")

lins = c("Distribution Regresion with cloglog link"="solid",
         "Proportional Hazard"="dashed")

color_fill = "black"
#color_fill = "steelblue"
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
# Prepare matrix for the plot of ADME with Confidence interval using ggplot
#-----------------------------------------------------------------------------
# Pooled
adme=data.frame(tev)
adme$lb = kmdr.clog.ame$adme.uniform.lb
adme$ub = kmdr.clog.ame$adme.uniform.ub
adme$kmdr.clog = kmdr.clog.ame$adme
adme$cox = cox.ame
adme$lb.point = kmdr.clog.ame$adme.pointwise.lb
adme$ub.point = kmdr.clog.ame$adme.pointwise.ub

#-----------------------------------------------------------------------------
# Subsamples based on net wealth
adme.below.median=data.frame(tev)
adme.below.median$lb = kmdr.clog.ame.below.median$adme.uniform.lb
adme.below.median$ub = kmdr.clog.ame.below.median$adme.uniform.ub
adme.below.median$kmdr.clog = kmdr.clog.ame.below.median$adme
adme.below.median$cox = cox.ame.below.median
adme.below.median$lb.point = kmdr.clog.ame.below.median$adme.pointwise.lb
adme.below.median$ub.point = kmdr.clog.ame.below.median$adme.pointwise.ub

adme.above.median=data.frame(tev)
adme.above.median$lb = kmdr.clog.ame.above.median$adme.uniform.lb
adme.above.median$ub = kmdr.clog.ame.above.median$adme.uniform.ub
adme.above.median$kmdr.clog = kmdr.clog.ame.above.median$adme
adme.above.median$cox = cox.ame.above.median
adme.above.median$lb.point = kmdr.clog.ame.above.median$adme.pointwise.lb
adme.above.median$ub.point = kmdr.clog.ame.above.median$adme.pointwise.ub
#-----------------------------------------------------------------------------
# Subsamples based on mortgage
adme.m1=data.frame(tev)
adme.m1$lb = kmdr.clog.ame.m1$adme.uniform.lb
adme.m1$ub = kmdr.clog.ame.m1$adme.uniform.ub
adme.m1$kmdr.clog = kmdr.clog.ame.m1$adme
adme.m1$cox = cox.ame.m1
adme.m1$lb.point = kmdr.clog.ame.m1$adme.pointwise.lb
adme.m1$ub.point = kmdr.clog.ame.m1$adme.pointwise.ub

adme.m0=data.frame(tev)
adme.m0$lb = kmdr.clog.ame.m0$adme.uniform.lb
adme.m0$ub = kmdr.clog.ame.m0$adme.uniform.ub
adme.m0$kmdr.clog = kmdr.clog.ame.m0$adme
adme.m0$cox = cox.ame.m0
adme.m0$lb.point = kmdr.clog.ame.m0$adme.pointwise.lb
adme.m0$ub.point = kmdr.clog.ame.m0$adme.pointwise.ub
#-----------------------------------------------------------------------------


#-----------------------------------------------------------------------------
# Plots for the differences (heterogeneity)
adme.m.het=data.frame(tev)
adme.m.het$lb = adme_het_mortgage$uniform.lb
adme.m.het$ub = adme_het_mortgage$uniform.ub
adme.m.het$kmdr.clog = adme_het_mortgage$diff_adme
adme.m.het$cox = NA
adme.m.het$lb.point = adme_het_mortgage$pointwise.lb
adme.m.het$ub.point = adme_het_mortgage$pointwise.ub

adme.w.het=data.frame(tev)
adme.w.het$lb = adme_het_wealth$uniform.lb
adme.w.het$ub = adme_het_wealth$uniform.ub
adme.w.het$kmdr.clog = adme_het_wealth$diff_adme
adme.w.het$cox = NA
adme.w.het$lb.point = adme_het_wealth$pointwise.lb
adme.w.het$ub.point = adme_het_wealth$pointwise.ub

#-----------------------------------------------------------------------------
# Scale the marginal effects
scale <- 10
d.max <- dim(adme)[2]

adme[,2:d.max] = scale * adme[,2:d.max]

adme.above.median[,2:d.max] = scale * adme.above.median[,2:d.max]
adme.below.median[,2:d.max] = scale * adme.below.median[,2:d.max]

adme.m1[,2:d.max] = scale * adme.m1[,2:d.max]
adme.m0[,2:d.max] = scale * adme.m0[,2:d.max]


adme.w.het[,2:d.max] = scale * adme.w.het[,2:d.max]
adme.m.het[,2:d.max] = scale * adme.m.het[,2:d.max]


#Range for plots
y.median.range = range(adme.above.median$lb, adme.below.median$lb,
                       adme.above.median$ub, adme.below.median$ub,
                       adme.above.median$cox, adme.below.median$cox,
                       
                       adme.m1$lb, adme.m0$lb,
                       adme.m1$ub, adme.m0$ub,
                       adme.m1$cox, adme.m0$cox
                       )

#Range for plots
y.range.het = range(adme.w.het$lb, adme.m.het$lb,
                    adme.w.het$ub, adme.m.het$ub
)

#-----------------------------------------------------------------------------
# Pooled data: NO SUBGROUPS BASELINE  
pooled <- ggplot(adme, aes(x = tev, y = kmdr.clog, group=1))+
  geom_ribbon(aes(ymin= lb, ymax=  ub),  alpha=.25, fill = color_fill)+
  geom_ribbon(aes(ymin=  lb.point, ymax=  ub.point),  alpha=.4, fill = color_fill)+
  geom_line(aes(colour="Distribution Regresion with cloglog link",
                linetype="Distribution Regresion with cloglog link"), size=1)+
  geom_hline(yintercept = 0, colour="red4", size = 0.5, linetype = "dashed")+
  xlab("Weeks Unemployed")+
  ylab("Average Distribution Marginal Effects, in percentage points")+
  scale_y_continuous(limits = c(-3,1),
                     breaks=c(seq(-3,1, 1)) ) +
  scale_x_continuous(breaks=seq(5,50, 5), expand = c(0.01, 0.1))+
  scale_colour_manual(name="Estimators", values=cols)+
  scale_linetype_manual(name="Estimators", values=lins)+
  theme(legend.text = element_text( size = 8))+
  theme(legend.title=element_blank())+
  theme(legend.position="bottom")+
  theme(plot.title = element_text(color="darkgray", 
                                  face="bold", size=10)) + 
  theme(axis.title = element_text(color="black",  size=8))+
  ggtitle("All workers")+
  guides(linetype=guide_legend(keywidth = 4, keyheight = 1),
         colour=guide_legend(keywidth = 4, keyheight = 1))

#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
# Below median net wealth
below.median <- ggplot(adme.below.median, aes(x=tev, y=kmdr.clog,group=1))+
  geom_ribbon(aes(ymin= lb, ymax=  ub), alpha=0.25, fill = color_fill)+
  geom_ribbon(aes(ymin=  lb.point, ymax =  ub.point), alpha=0.4, fill = color_fill)+
  geom_line(aes(colour="Distribution Regresion with cloglog link",
                linetype="Distribution Regresion with cloglog link"),
            size=1)+
  geom_hline(yintercept = 0,colour="red4", size = 0.5, linetype = "dashed")+
  xlab("Weeks Unemployed")+
  ylab("Average Distribution Marginal Effects, in percentage points")+
  scale_y_continuous(limits=  y.median.range,
                     breaks=c(seq(-40,35, 10)) * (scale / 100)) +
  scale_x_continuous(breaks=seq(5,50, 5), expand = c(0.01, 0.1))+
  scale_colour_manual(name="Estimators", values=cols)+
  scale_linetype_manual(name="Estimators", values=lins)+
  theme(legend.text = element_text( size = 8))+
  theme(legend.title = element_text(size=8))+
  theme(legend.title=element_blank())+
  theme(legend.position="bottom")+
  theme(plot.title = element_text(color="darkgray", face="bold", size=10)) + 
  theme(axis.title = element_text(color="black",  size=8))+
  ggtitle("(a) Workers with net wealth below the median")+
  guides(linetype=guide_legend(keywidth = 4, keyheight = 1),
         colour=guide_legend(keywidth = 4, keyheight = 1))
#-----------------------------------------------------------------------------
# abv median net wealth
abv.median <- ggplot(adme.above.median, aes(x=tev, y=kmdr.clog, group=1))+
  geom_ribbon(aes(ymin= lb, ymax=  ub), alpha=0.25, fill = color_fill)+
  geom_ribbon(aes(ymin=  lb.point, ymax =  ub.point), alpha=0.4, fill = color_fill)+
  geom_line(aes(colour="Distribution Regresion with cloglog link",
                linetype="Distribution Regresion with cloglog link"),
            size=1)+
  geom_hline(yintercept = 0,colour="red4", size = 0.5, linetype = "dashed")+
  xlab("Weeks Unemployed")+
  ylab("Average Distribution Marginal Effects, in percentage points")+
  scale_y_continuous(limits=  y.median.range,
                     breaks=c(seq(-40,35, 10)) * (scale / 100)) +
  scale_x_continuous(breaks=seq(5,50, 5), expand = c(0.01, 0.1))+
  scale_colour_manual(name="Estimators", values=cols)+
  scale_linetype_manual(name="Estimators", values=lins)+
  theme(legend.text = element_text( size = 8))+
  theme(legend.title = element_text(size=8))+
  theme(legend.title=element_blank())+
  theme(legend.position="bottom")+
  theme(plot.title = element_text(color="darkgray", face="bold", size=10)) + 
  theme(axis.title = element_text(color="black",  size=8))+
  ggtitle("(b) Workers with net wealth above the median")+
  guides(linetype=guide_legend(keywidth = 4, keyheight = 1),
         colour=guide_legend(keywidth = 4, keyheight = 1))
#-----------------------------------------------------------------------------
#Workers with mortgage
m1 <- ggplot(adme.m1, aes(x=tev, y=kmdr.clog, group=1))+
  geom_ribbon(aes(ymin= lb, ymax=  ub), alpha=0.25, fill = color_fill)+
  geom_ribbon(aes(ymin=  lb.point, ymax=  ub.point), alpha=0.4, fill = color_fill)+
  geom_line(aes(colour="Distribution Regresion with cloglog link",
                linetype="Distribution Regresion with cloglog link"),
            size=1)+
  geom_hline(yintercept = 0,colour="red4", size = 0.5, linetype = "dashed")+
  xlab("Weeks Unemployed")+
  ylab("Average Distribution Marginal Effects, in percentage points")+
  scale_y_continuous(limits= y.median.range,
                     breaks=c(seq(-40,20, 10)) * (scale / 100)) +
  scale_x_continuous(breaks=seq(5,50, 5), expand = c(0.01, 0.1))+
  scale_colour_manual(name="Estimators", values=cols)+
  theme(legend.text = element_text( size = 8))+
  theme(legend.title = element_text(size=8))+
  theme(legend.title=element_blank())+
  theme(legend.position="bottom")+
  scale_linetype_manual(name="Estimators", values=lins)+
  theme(plot.title = element_text(color="darkgray", face="bold", size=10)) + 
  theme(axis.title = element_text(color="black",  size=8))+
  ggtitle("(c) Workers with mortgages")+
  guides(linetype=guide_legend(keywidth = 4, keyheight = 1),
         colour=guide_legend(keywidth = 4, keyheight = 1))
#-----------------------------------------------------------------------------
#Workers without mortgage
m0 <- ggplot(adme.m0, aes(x=tev, y=kmdr.clog, group=1))+
  geom_ribbon(aes(ymin= lb, ymax=  ub), alpha=0.25, fill = color_fill)+
  geom_ribbon(aes(ymin=  lb.point, ymax=  ub.point), alpha=0.4, fill = color_fill)+
  geom_line(aes(colour="Distribution Regresion with cloglog link",
                linetype="Distribution Regresion with cloglog link"),
            size=1)+
  geom_hline(yintercept = 0,colour="red4", size = 0.5, linetype = "dashed")+
  xlab("Weeks Unemployed")+
  ylab("Average Distribution Marginal Effects, in percentage points")+
  scale_y_continuous(limits=y.median.range,
                     breaks=c(seq(-40,20, 10)) * (scale / 100)) +
  scale_x_continuous(breaks=seq(5,50, 5),expand = c(0.01, 0.1))+
  scale_colour_manual(name="Estimators", values=cols)+
  scale_linetype_manual(name="Estimators", values=lins)+
  theme(legend.text = element_text( size = 8))+
  theme(legend.title = element_text(size=8))+
  theme(legend.title=element_blank())+
  theme(legend.position="bottom")+
  theme(plot.title = element_text(color="darkgray", face="bold", size=10)) + 
  theme(axis.title = element_text(color="black",  size=8))+
  ggtitle("(d) Workers without mortgages")+
  guides(linetype=guide_legend(keywidth = 4, keyheight = 1),
         colour=guide_legend(keywidth = 4, keyheight = 1))
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
# Plot the differences
#  net wealth
het_wealth<- ggplot(adme.w.het, aes(x=tev, y=kmdr.clog, group=1))+
  geom_ribbon(aes(ymin= lb, ymax=  ub), alpha=0.25, fill = color_fill)+
  geom_ribbon(aes(ymin=  lb.point, ymax =  ub.point), alpha=0.4, fill = color_fill)+
  geom_line(aes(colour="Distribution Regresion with cloglog link",
                linetype="Distribution Regresion with cloglog link"),
            size=1)+
  geom_hline(yintercept = 0,colour="red4", size = 0.5, linetype = "dashed")+
  xlab("Weeks Unemployed")+
  ylab("Difference of Average Distribution Marginal Effects, in percentage points")+
  scale_y_continuous(limits=  y.range.het,
                     breaks=c(seq(-40,35, 10)) * (scale / 100)) +
  scale_x_continuous(breaks=seq(5,50, 5), expand = c(0.01, 0.1))+
  scale_colour_manual(name="Estimators", values=cols)+
  scale_linetype_manual(name="Estimators", values=lins)+
  theme(legend.text = element_text( size = 8))+
  theme(legend.title = element_text(size=8))+
  theme(legend.title=element_blank())+
  theme(legend.position="bottom")+
  theme(plot.title = element_text(color="darkgray", face="bold", size=10)) + 
  theme(axis.title = element_text(color="black",  size=8))+
  ggtitle("(a) Difference of ADME between workers \nwith net wealth below and above the median")+
  guides(linetype=guide_legend(keywidth = 4, keyheight = 1),
         colour=guide_legend(keywidth = 4, keyheight = 1))
#-----------------------------------------------------------------------------
# mortgage
het_mortgage<- ggplot(adme.m.het, aes(x=tev, y=kmdr.clog, group=1))+
  geom_ribbon(aes(ymin= lb, ymax=  ub), alpha=0.25, fill = color_fill)+
  geom_ribbon(aes(ymin=  lb.point, ymax =  ub.point), alpha=0.4, fill = color_fill)+
  geom_line(aes(colour="Distribution Regresion with cloglog link",
                linetype="Distribution Regresion with cloglog link"),
            size=1)+
  geom_hline(yintercept = 0,colour="red4", size = 0.5, linetype = "dashed")+
  xlab("Weeks Unemployed")+
  ylab("Difference of Average Distribution Marginal Effects, in percentage points")+
  scale_y_continuous(limits=  y.range.het,
                     breaks=c(seq(-40,35, 10)) * (scale / 100)) +
  scale_x_continuous(breaks=seq(5,50, 5), expand = c(0.01, 0.1))+
  scale_colour_manual(name="Estimators", values=cols)+
  scale_linetype_manual(name="Estimators", values=lins)+
  theme(legend.text = element_text( size = 8))+
  theme(legend.title = element_text(size=8))+
  theme(legend.title=element_blank())+
  theme(legend.position="bottom")+
  theme(plot.title = element_text(color="darkgray", face="bold", size=10)) + 
  theme(axis.title = element_text(color="black",  size=8))+
  ggtitle("(b) Difference of ADME between workers \nwith and without mortgage")+
  guides(linetype=guide_legend(keywidth = 4, keyheight = 1),
         colour=guide_legend(keywidth = 4, keyheight = 1))
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
# Combine plots
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
# Make combine plots
get_legend<-function(myggplot){
  tmp <- ggplot_gtable(ggplot_build(myggplot))
  leg <- which(sapply(tmp$grobs, function(x) x$name) == "guide-box")
  legend <- tmp$grobs[[leg]]
  return(legend)
}

#get legend
legend <- get_legend(pooled)

# Remove legend of all plot
pooled <- pooled + theme(legend.position = "none") 
below.median <- below.median + theme(legend.position = "none")
abv.median <- abv.median + theme(legend.position = "none")
m1 <- m1 + theme(legend.position = "none") 
m0 <- m0 + theme(legend.position = "none")

het_wealth <- het_wealth + theme(legend.position = "none") 
het_mortgage <- het_mortgage + theme(legend.position = "none") 
# fix scale
# m1 <- m1 +  scale_y_continuous(limits=  c(-4.2, 1.5),
#                                breaks=c(seq(-4, 1,1)))
# m0 <- m0 +  scale_y_continuous(limits=  c(-4.2, 1.5),
#                                breaks=c(seq(-4,1,1)))

#-----------------------------------------------------------------------------
# Plot pooled
ggsave(here("figures/ub-adme-baseline.pdf"), width = 6, height = 4,
       units = "in", plot = pooled)


# Plot different measures of liquidity constraint
adme.liquidity <- grid.arrange( below.median, abv.median,
                                m1, m0,
                                ncol = 2, nrow=2,
                                layout_matrix = rbind(c(1,2), c(3,4)))
ggsave(here("figures/ub-adme-liquidity.pdf"), width = 8.5, height = 8, units = "in", 
       plot = adme.liquidity)


# Plot the different measures of liquidity constraint
adme_het_liquidity <- grid.arrange( het_wealth, het_mortgage,
                                ncol = 2, nrow=1,
                                layout_matrix = rbind(c(1,2)))
ggsave(here("figures/ub-adme-het-liquidity.pdf"), width = 8.5, height = 4, units = "in", 
       plot = adme_het_liquidity)
#-----------------------------------------------------------------------------