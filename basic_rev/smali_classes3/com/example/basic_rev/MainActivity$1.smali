.class Lcom/example/basic_rev/MainActivity$1;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/example/basic_rev/MainActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/example/basic_rev/MainActivity;

.field final synthetic val$seed:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/example/basic_rev/MainActivity;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lcom/example/basic_rev/MainActivity;

    .line 53
    iput-object p1, p0, Lcom/example/basic_rev/MainActivity$1;->this$0:Lcom/example/basic_rev/MainActivity;

    iput-object p2, p0, Lcom/example/basic_rev/MainActivity$1;->val$seed:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .line 56
    iget-object v0, p0, Lcom/example/basic_rev/MainActivity$1;->this$0:Lcom/example/basic_rev/MainActivity;

    iget-object v0, v0, Lcom/example/basic_rev/MainActivity;->ed1:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/example/basic_rev/MainActivity$1;->this$0:Lcom/example/basic_rev/MainActivity;

    iget-object v2, p0, Lcom/example/basic_rev/MainActivity$1;->val$seed:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/example/basic_rev/MainActivity;->makeFlag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 57
    iget-object v0, p0, Lcom/example/basic_rev/MainActivity$1;->this$0:Lcom/example/basic_rev/MainActivity;

    invoke-virtual {v0}, Lcom/example/basic_rev/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v2, "Well played! You can validate now with this password :)"

    invoke-static {v0, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 58
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 60
    :cond_0
    iget-object v0, p0, Lcom/example/basic_rev/MainActivity$1;->this$0:Lcom/example/basic_rev/MainActivity;

    invoke-virtual {v0}, Lcom/example/basic_rev/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v2, "Try again ;)"

    invoke-static {v0, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 62
    :goto_0
    return-void
.end method
