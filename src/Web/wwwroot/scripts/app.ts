// Assign an event listener to the delete buttons
$(`.delete-btn`).click((deleteRecord) as any);

class ColorRecord {
    constructor(public id: string, public row: JQuery<HTMLElement>) {
        console.log(`Created a color record object successfully  👍`);
    }

    remove(record: ColorRecord = this) {
        $.ajax({
            type: `DELETE`,
            url: `https://localhost:44367/api/Colors/${record.id}`,
            dataType: `json`,
            contentType: `application/json`,
            success() {
                record.row.remove();
                console.log(`Successfully removed ${record.id} 👍`);
            },
            error(XMLHttpRequest: JQueryXHR, textStatus: string, errorThrown: string) {
                console.log(`Unable to remove record ${record.id}, sorry 😔`);
                console.log(XMLHttpRequest);
                console.log(textStatus);
                console.log(errorThrown);
            }
        });
    }
}

function deleteRecord(event: JQueryEventObject): void {
    console.log(`Executing the deleteRecord function 👍`);
    const record = new ColorRecord((event.target as HTMLElement).dataset[`id`] as string, $(event.target).parent().parent());
    record.remove();
}

// Create an event listener to the deleteAll 
$(`#delete-all`).click(deleteSelected);

function deleteSelected(): void {
    for (let item of $(`input[type="checkbox"]:checked`).toArray()) {
        $(`.delete-btn[data-id=${item.dataset[`id`]}]`).click();
    }
}